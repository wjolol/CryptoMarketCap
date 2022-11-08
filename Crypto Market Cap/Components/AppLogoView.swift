//
//  AppLogoView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

struct AppLogoView: View {
    var body: some View {
        
        HStack {
            Image("brandIcon").resizable().frame(width: 50, height: 50)
            Text("CRYPTO MARKET CAP")
        }
    }
}

struct AppLogoView_Previews: PreviewProvider {
    static var previews: some View {
        AppLogoView()
    }
}
