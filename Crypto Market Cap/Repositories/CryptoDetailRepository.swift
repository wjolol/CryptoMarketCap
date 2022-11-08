//
//  CryptoDetailRepository.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//
import Foundation
import Combine

class CryptoDetailRepository {
    
    func fetchCryptoDetail(id: String) -> AnyPublisher<CoinDetailModel, any Error> {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> CoinDetailModel in
                
                let decoder = JSONDecoder()
                do {
                    return try decoder.decode(CoinDetailModel.self, from: data)
                } catch {
                    throw try decoder.decode(ErrorResponse.self, from: data)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchCryptoMarketData(id: String) -> AnyPublisher<CryptoMarketDataModel, any Error> {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)/market_chart?vs_currency=eur&days=6&interval=daily")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> CryptoMarketDataModel in
                
                let decoder = JSONDecoder()
                do {
                    return try decoder.decode(CryptoMarketDataModel.self, from: data)
                } catch {
                    throw try decoder.decode(ErrorResponse.self, from: data)
                }
            }
            .eraseToAnyPublisher()
    }
}

