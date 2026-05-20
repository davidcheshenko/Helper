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
    var onError: ((String) -> Void)?
    
    // MARK: - Lifecycle
    
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        networkService.getNews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                guard let articles = articles else { return }
                self.onNewsLoaded?(articles)
            case .failure(let error):
                let userMessage = self.mapErrorToMessage(error)
                self.onError?(userMessage)
            }
        }
    }
    
    func fetchImageData(from urlString: String?, completion: @escaping (Data?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}

private extension NewsViewModel {
    
    func mapErrorToMessage(_ error: Error) -> String {
        let nsError = error as NSError
        
        if nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorNotConnectedToInternet {
            return "No internet connection"
        }
        
        return "Failed to load news"
    }
}
