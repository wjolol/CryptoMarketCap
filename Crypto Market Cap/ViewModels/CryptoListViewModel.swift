//
//  CryptoListViewModel.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 03/11/22.
//

import Foundation
import Combine

class CryptoListViewModel: ObservableObject, Identifiable {
    
    @Published var state: CryptoListPageState = .Creation
    
    let repository: CryptoListRepository = CryptoListRepository()
    
    private var disposables = Set<AnyCancellable>()
    
    //Fetch the list of top 10 cryptos ordered by market cap
    func retrieveCryptoList() {
        repository.fetchCryptoList().sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                //in case of failure we tell the view to show the component for the error
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
                //when we receive the data already mapped we send it back to the UI to be displayed
                DispatchQueue.main.async {
                    self.state = .ListFetched(value)
                }
            }
        ).store(in: &disposables) //important to keep alive the subscription
        
    }
    
    //Possible UI states
    enum CryptoListPageState {
        case Creation
        case ListFetched([CoinModel])
        case ApiError(Error)
    }
    
}
