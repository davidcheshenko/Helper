//
//  NetworkService.swift
//  Helper
//
//  Created by David Cheshenko on 23.02.26.
//

import Foundation

final class NetworkService: INetworkService {
    
    func getNews(completion: @escaping NewsCompletion ) {
        getRequest(URLString: baseNewsURL + ) { result in
            switch result {
            case .failure(let rerror):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(jsonData.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
extension NetworkService {
    
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
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

