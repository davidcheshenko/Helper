//
//  NewsViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

class NewsViewModel: INewsViewModel {
    
    // MARK: - Private properties
    
    private let networkService: INetworkService
    
    // MARK: - Public properties
    var articles: [Article]
    var onNewsLoaded: (([Article]) -> Void )?
    
    // MARK: - Lifecycle
    
    init(networkService: INetworkService, articles: [Article]) {
        self.networkService = networkService
        self.articles = articles
    }
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        networkService.getNews { result in
            switch result {
            case .success(let articles):
                guard let articles = articles else { return }
                self.articles = articles
                self.onNewsLoaded?(articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
