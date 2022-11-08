//
//  CryptoDetailView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI
import ExpandableText

struct CryptoDetailView: View {
    
    @ObservedObject var vm = CryptoDetailViewModel()
    
    var id: String
    var name: String
    var imageUrl: URL?
    
    init(id: String, name: String, imageUrl: URL?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        VStack(spacing: 10) {
            //Image and name of the crypto
            HStack {
                ImageDownloader(url: imageUrl, width: 50, height: 50)
                Text(name)
            }.font(.system(size: 50))
            
            Group { () -> AnyView in
                switch vm.state {
                case .Creation:
                    return AnyView(Text("Loading Data..."))
                    
                case .MarketDataFetched:
                    vm.retrieveCryptoDetail(id: id)
                    return AnyView(Text("Loading Data..."))
                    
                case .DetailFetched(let coinDetail):
                    return AnyView(CryptoDetailViewComponent(coinDetail: coinDetail, marketDataArray: vm.marketDataDictionary))
                    
                case .ApiError(let errorMessage):
                    return AnyView(
                        Text(errorMessage.localizedDescription)
                    )
                case .GenericError:
                    return AnyView(
                        Text("Error while fetching the data")
                    )
                }
            }.onAppear {
                vm.retrieveCryptoMarketData(id: id)
            }
        }
    }
    
    struct CryptoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            CryptoDetailView(id: "ethereum", name: "Ethereum", imageUrl: URL(string: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880"))
        }
    }
}
