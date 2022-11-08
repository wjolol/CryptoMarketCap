//
//  CryptoListRowView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

struct CryptoListRowView: View {
    
    var coin: CoinModel
    
    var body: some View {
        //used to specify to which view navigate when tapping on the row
        NavigationLink(destination: CryptoDetailView(id: coin.id, name: coin.name, imageUrl: coin.imageURL)) {
            
            HStack(spacing: 0) {
                Text(String(coin.market_cap_rank)).padding(.trailing, 10)
                
                HStack(spacing: 10) {
                    
                    ImageDownloader(url: coin.imageURL, width: 25, height: 25)
                    
                    Text(coin.name).padding(.trailing, 5)
                    Text(coin.symbol.uppercased()).padding(.trailing, 25)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)

                Text(coin.price)
                    .foregroundColor(coin.isUptrend ? .green : .red)
            }
        }
    }
}

struct CryptoListRowView_Previews: PreviewProvider {
    
    static let coinPreview = CoinModel(id: "bitcoin", symbol: "BTC", name: "Bitcoin", current_price: 24000, market_cap: 50000000, market_cap_rank: 1, price_change_24h: 30.123)
    
    static var previews: some View {
        CryptoListRowView(coin: coinPreview)
            .previewLayout(.sizeThatFits)
            
    }
}
