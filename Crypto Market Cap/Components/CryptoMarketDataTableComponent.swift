//
//  CryptoMarketDataTableComponent.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 05/11/22.
//

import SwiftUI

struct CryptoMarketDataTableComponent: View {
    
    var marketDataArray: CryptoMarketDataDictionary?
    
    var body: some View {
        //Used to group the rows togheter
        LazyVStack(spacing: 1) {
            //Table legend
            HStack(spacing: 5) {
                Text("Price").frame(maxWidth: .infinity)
                Text("Date").frame(maxWidth: .infinity)
            }.frame(height: 35).padding([.top], 2.5)
            
            //Horizontal separator
            Rectangle().frame(height: 2).padding([.leading,.trailing], 10)
            
            //Prices and dates
            ForEach((marketDataArray!.dictionaryPrices.sorted(by: >)), id: \.key) { key, value in
                HStack(spacing: 5) {
                    Text(Utility.formatToPrice(price: value)).frame(maxWidth: .infinity)
                    Text(Utility.formatDate(date: key)).frame(maxWidth: .infinity, maxHeight: 50)
                }.frame(height: 35)
            }
        }.background(Colors.BgColor)
            .cornerRadius(25)
            .padding([.leading, .trailing], 20)
    }
}

struct CryptoMarketDataTableComponent_Previews: PreviewProvider {
    static var previews: some View {
        CryptoMarketDataTableComponent(marketDataArray: CryptoMarketDataDictionary(dictionaryPrices: [
            1667001600000 : 10000,
            1667088000000 : 24573.69,
            1667174400000 : 20001.43,
            1667260800000 : 28000.8978,
            1667347200000 : 30000.62,
            1667500000000 : 33000.94,
            1667557200000 : 38000.38
            ])
        )
    }
}
