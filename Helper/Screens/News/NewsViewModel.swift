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
    private(set) var articles: [Article] = []
    
    // MARK: - Public properties
    
    var onNewsLoaded: (() -> Void)?
    
    // MARK: - Lifecycle
 
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods

    func viewDidLoad() {
        networkService.getNews { result in
            switch result {
            case .success(let articles):
                guard let articles = articles else { return }
                self.articles = articles
                self.onNewsLoaded?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
