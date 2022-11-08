//
//  Crypto_Market_CapApp.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

@main
struct Crypto_Market_CapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CryptoListViewModel())
        }
    }
}
