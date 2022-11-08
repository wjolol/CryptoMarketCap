//
//  CryptoListRepository.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 03/11/22.
//

import Foundation
import Combine

class CryptoListRepository {
    
    func fetchCryptoList() -> AnyPublisher<[CoinModel], any Error> {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1&sparkline=false")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> [CoinModel] in
                
                let decoder = JSONDecoder()
                do {
                    //Try decoding the json response with the given model, if it fails it will send an error with the problem
                    return try decoder.decode([CoinModel].self, from: data)
                } catch {
                    //try to decode `ErrorResponse` and throw it as an error
                    throw try decoder.decode(ErrorResponse.self, from: data)
                }
            }
            .eraseToAnyPublisher()
    }
}

struct ErrorResponse: Decodable, Error {
    let message: String
}
