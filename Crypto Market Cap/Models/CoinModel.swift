//
//  CoinModel.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1&sparkline=false

import Foundation

struct CoinModel: Decodable, Identifiable {
    
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
    let market_cap: Int
    let market_cap_rank: Int
    let price_change_24h: Float
    let image: String?
    
    var imageURL: URL? {
        if let urlString = image, let url = URL(string: urlString) {
            return url
        } else {
            return nil
        }
    }
    
    var isUptrend: Bool {
        return price_change_24h >= 0 ? true : false
    }
    
    var price: String {
        return Utility.formatToPrice(price: current_price)
    }
    
    init() {
        self.id = ""
        self.symbol = ""
        self.name = ""
        self.current_price = 0
        self.market_cap = 0
        self.market_cap_rank = 0
        self.price_change_24h = 0
        self.image = ""
    }

    init(id: String, symbol: String, name: String, current_price: Double, market_cap: Int, market_cap_rank: Int, price_change_24h: Float, image: String? = nil) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.current_price = current_price
        self.market_cap = market_cap
        self.market_cap_rank = market_cap_rank
        self.price_change_24h = price_change_24h
        self.image = image
    }
    

    
}
