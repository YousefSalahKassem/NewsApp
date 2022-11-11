//
//  HomeView.swift
//  newsApp
//
//  Created by kortobaa on 11/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            
            switch viewModel.state {
            case .loading : ProgressView()
            case .failed(let error): ErrorView(error: error, handler: viewModel.getArticles)
            case.success(let articles): NavigationView{
                List(articles) { article in
                    ArticleView(article: article).onTapGesture {
                        load(url: article.url)
                    }
                }
            }.navigationTitle(Text("News"))
        }
        }.onAppear(
            perform: viewModel.getArticles
        )
    }
    
    func load(url: String?){
        guard let link = url,
                let url = URL(string: link) else { return }
        openUrl(url)
    }
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
