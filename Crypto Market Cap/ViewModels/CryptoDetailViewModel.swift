//
//  CryptoDetailViewModel.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//
import Foundation
import Combine

class CryptoDetailViewModel: ObservableObject, Identifiable {
    
    @Published var state: CryptoDetailPageState = .Creation
    
    let repository: CryptoDetailRepository = CryptoDetailRepository()
    
    var marketData: CryptoMarketDataModel?
    var marketDataDictionary = CryptoMarketDataDictionary(dictionaryPrices: [:])
    
    private var disposables = Set<AnyCancellable>()
    
    //Fetch the given crypto's detail using the id passed from the crypto list
    func retrieveCryptoDetail(id: String) {
        repository.fetchCryptoDetail(id: id).sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                  case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                        self?.state = .ApiError(error)
                    }
                  case .finished:
                    print("Finished successfuly")
                }
            },
            receiveValue: { value in
                print(value)
                DispatchQueue.main.async {
                    self.state = .DetailFetched(value)
                }
            }
        ).store(in: &disposables)
    }
    
    //Fetch the given crypto's market data using the id passed from the crypto list
    func retrieveCryptoMarketData(id: String) {
        repository.fetchCryptoMarketData(id: id).sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                  case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                        self?.state = .ApiError(error)
                    }
                  case .finished:
                    print("Finished successfuly")
                }
            },
            receiveValue: { value in
                print(value)
                DispatchQueue.main.async {
                    self.marketData = value
                    let _ = value.prices.map { price in
                        self.marketDataDictionary.dictionaryPrices.updateValue(price[1], forKey: price[0])
                    }
                    if self.marketDataDictionary.dictionaryPrices.isEmpty {
                        self.state = .GenericError
                    } else {
                        self.state = .MarketDataFetched
                    }
                    
                }
            }
        ).store(in: &disposables)
    }
    
    //Possible UI states
    enum CryptoDetailPageState {
        case Creation
        case MarketDataFetched
        case DetailFetched(CoinDetailModel)
        case ApiError(Error)
        case GenericError
    }
    
}
