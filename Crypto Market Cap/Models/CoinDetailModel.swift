//
//  CoinDetailModel.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//

import Foundation

struct CoinDetailModel: Decodable {
    let symbol: String
    let name: String
    let description: [String : String]
    let links: Links
    
    var enDescription: String {
        guard let desc = description.first?.value else {
            return ""
        }
        return desc
    }
}

struct Links: Decodable {
    let homepage: [String]
}
