//
//  CryptoListView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//

import SwiftUI

struct CryptoListView: View {
    var coins: [CoinModel]

    var body: some View {
        List {
            Section {
                ForEach(coins) { coin in
                    //row with the crypto's data
                    CryptoListRowView(coin: coin)
                }
            } header: {
                //header with the columns meaning
                CryptoListHeaderView()
            } footer: {
                Text("The crypto's in this list are ordered by market cap")
            }
            
            //To remove the button to collapse the list
        }.listStyle(InsetGroupedListStyle())
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static let coinsPreview = [
        CoinModel(id: "bitcoin", symbol: "BTC", name: "Bitcoin", current_price: 24000, market_cap: 50000000, market_cap_rank: 1, price_change_24h: 30.123),
        CoinModel(id: "ethereum", symbol: "ETH", name: "Ethereum", current_price: 1500, market_cap: 100000, market_cap_rank: 2, price_change_24h: -30.123)
    ]
    
    static var previews: some View {
        CryptoListView(coins: coinsPreview)
    }
}
