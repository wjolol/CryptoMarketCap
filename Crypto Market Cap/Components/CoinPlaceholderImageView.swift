//
//  CoinPlaceholderImageView.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 02/11/22.
//

import SwiftUI

struct CoinPlaceholderImageView: View {
    var body: some View {
        Image("coin")
            .resizable()
            .frame(width: 25, height: 25)
            .padding(.trailing, 4)
    }
}

struct CoinPlaceholderImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinPlaceholderImageView()
    }
}
