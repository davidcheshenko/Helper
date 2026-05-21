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
    var onNewsLoaded: (([Article]) -> Void )?
    var onError: ((String?) -> Void)?
    
    // MARK: - Lifecycle
    
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        networkService.getNews { [weak self] result in
            switch result {
            case .success(let articles):
                guard let articles = articles else {
                    self?.onError?("Failed to load news")
                    return
                }
                self?.onNewsLoaded?(articles)
            case .failure(let error):
                self?.onError?(self?.mapErrorToMessage(error: error))
            }
        }
    }
    
    func fetchImageData(string: String?, completion: @escaping (Data) -> Void) {
        guard let string = string, let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            completion(data)
        }
        .resume()
    }
}

private extension NewsViewModel {
    
    func mapErrorToMessage(error: Error) -> String {
        if (error as NSError).domain == NSURLErrorDomain && (error as NSError).code == NSURLErrorNotConnectedToInternet {
            return "No internet connection"
        }
        return "Failed to load news"
    }
}
