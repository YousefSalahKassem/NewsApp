//
//  ArticleView.swift
//  newsApp
//
//  Created by kortobaa on 11/11/2022.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article : Article
    
    var body: some View {
        HStack{
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                URLImage(
                    url: url,
                    options: URLImageOptions(
                        identifier: article.id.uuidString,
                        cachePolicy: .returnStoreElseLoad(
                            cacheDelay: nil,
                            downloadDelay: 0.25
                        )
                    ),
                    failure: { error, _ in
                        PlaceHolderImageView()
                    },
                    content: { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                    }).frame(width: 100,height: 100).cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill").foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100,height: 100)
    }
}
