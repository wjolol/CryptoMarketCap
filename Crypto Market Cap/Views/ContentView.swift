//
//  ContentView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: CryptoListViewModel
    
    init(viewModel: CryptoListViewModel) {
        self.vm = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                //logo e nome app
                AppLogoView()
                
                Group { () -> AnyView in
                    switch vm.state {
                    case .Creation:
                        return AnyView(Text("Loading......"))
                        
                    case .ListFetched(let coinsList):
                        return AnyView(CryptoListView(coins: coinsList).refreshable {
                            print("Loading")
                            vm.retrieveCryptoList()
                        })
                        
                    case .ApiError(let errorMessage):
                        return AnyView(
                            Text(errorMessage.localizedDescription)
                        )
                    }
                }
            }
        }.onAppear {
            vm.retrieveCryptoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CryptoListViewModel())
    }
}

