//
//  NetworkService.swift
//  Helper
//
//  Created by David Cheshenko on 23.02.26.
//

import Foundation

final class NetworkService: INetworkService {
    
    func getNews(completion: @escaping NewsCompletion) {
        getRequest(url: Constants.newsBaseUrl + "everything?q=Apple&apiKey=" + Constants.apiKeyNews) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

private extension NetworkService {
    
    func getRequest(url: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
