//
//  CryptoListHeaderView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

struct CryptoListHeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 7) {
                Text("#")
                Text("|")
                Text("Coin")
            }
            Spacer()
            HStack(spacing: 7) {
                Text("|").padding(.leading, 10)
                Text("Price").padding(.trailing, 50)
            }
        }.font(.system(size: 16).bold())
    }
}

struct CryptoListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListHeaderView()
    }
}
