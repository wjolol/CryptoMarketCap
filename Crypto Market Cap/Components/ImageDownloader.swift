//
//  ImageDownloader.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//

import SwiftUI

struct ImageDownloader: View {
    
    var url: URL?
    var width: CGFloat
    var height: CGFloat
    
    init(url: URL?, width: CGFloat, height: CGFloat) {
        self.url = url
        self.width = width
        self.height = height
    }
    
    var body: some View {
        //tries to download the image from the given URL
        AsyncImage(url: url) { phase in
            switch phase {
            //loading
            case .empty:
                CoinPlaceholderImageView()
            //Success, display the image with the given width and height
            case .success(let image):
                image
                    .resizable()
                    .frame(width: width, height: height)
            //Failure, display the placeholder image
            case .failure:
                CoinPlaceholderImageView()
            //Used for future cases in case they are added so the app can still work
            @unknown default:
                CoinPlaceholderImageView()
            }
        }
    }
}

struct ImageDownloader_Previews: PreviewProvider {
    static var previews: some View {
        ImageDownloader(url: nil, width: 25, height: 25)
    }
}
