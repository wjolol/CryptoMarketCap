//
//  CryptoChartComponent.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 05/11/22.
//

import SwiftUI
import Charts

struct CryptoChartComponent: View {
    
    var marketDataArray: CryptoMarketDataDictionary?
    
    var body: some View {
        Chart {
            ForEach((marketDataArray?.dictionaryPrices.sorted(by: <))!, id: \.key) { item in
                LineMark(
                    x: .value("Date", Utility.formatDate(date: item.key, dateFormat: "dd/MM")),
                    y: .value("Price", item.value)
                )
            }
        }.frame(height: 250)
    }
}

struct CryptoChartComponent_Previews: PreviewProvider {
    static var previews: some View {
        CryptoChartComponent(marketDataArray: CryptoMarketDataDictionary(dictionaryPrices: [
            1667001600000 : 10000,
            1667088000000 : 24573.696768895566,
            1667174400000 : 20001.43298,
            1667260800000 : 28000.8978,
            1667347200000 : 30000.648361813386,
            1667500000000 : 30000.648361813386,
            1667557200000 : 38000.386
        ]))
    }
}
