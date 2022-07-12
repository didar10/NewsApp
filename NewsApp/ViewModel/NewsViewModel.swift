//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Didar Bakhitzhanov on 12.07.2022.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

final class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    
   @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    //Send back the articles
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    //Send back the error
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        cancellables.insert(cancellable)
    }
}
