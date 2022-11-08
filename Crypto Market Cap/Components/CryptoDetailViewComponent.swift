//
//  CryptoDetailViewComponent.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 05/11/22.
//

import SwiftUI
import ExpandableText

struct CryptoDetailViewComponent: View {
    
    var coinDetail: CoinDetailModel
    var marketDataArray: CryptoMarketDataDictionary?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                //Unfortunately Coingecko's market data API sends back for the price of the current day two values, one that has the latest price (eg. 06/11/2022 18:39:44) and another one that has the price at the start of the day (06/11/2022 01:00:00) so in the table and on the chart we have to values on the same day. There are a few solutions to this problem.
                
                //Chart with the daily prices of the last 7 days
                CryptoChartComponent(marketDataArray: marketDataArray).padding([.leading, .trailing, .top], 20)
                
                //Table with the daily price of the last 7 days
                CryptoMarketDataTableComponent(marketDataArray: marketDataArray)
                
                //Expandable textview because the descriptions are usually very long
                ExpandableText(text: coinDetail.enDescription)
                    .lineLimit(5)
                    .expandButton(TextSet(text: "read more", font: .body, color: .blue))
                    .collapseButton(TextSet(text: "read less", font: .body, color: .blue))
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 15)
                
                //Link to the crypto's website
                Link("Link to \(coinDetail.name) website", destination: URL(string: coinDetail.links.homepage[0])!)
            }
            
        }
    }
    
    struct CryptoDetailViewComponent_Previews: PreviewProvider {
        static var previews: some View {
            CryptoDetailView(id: "tether", name: "Thether USD", imageUrl: URL(string: "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707"))
        }
    }
}
