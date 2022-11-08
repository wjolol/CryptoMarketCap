//
//  CryptoMarketDataModel.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//

import Foundation

struct CryptoMarketDataModel: Decodable {
    let prices: [[Double]]
}

struct CryptoMarketDataDictionary: Decodable {
    var dictionaryPrices: [Double : Double]
}

