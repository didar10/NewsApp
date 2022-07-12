//
//  ArticleView.swift
//  NewsApp
//
//  Created by Didar Bakhitzhanov on 12.07.2022.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
//            if let imgUrl = article.image,
//               let url = URL(string: imgUrl) {
//                URLImage(url: url,
//                         options: URLImageOptions
//                         content: { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//
//                })
//            } else {
//
//            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}
