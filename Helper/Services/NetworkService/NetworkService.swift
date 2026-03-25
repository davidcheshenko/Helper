//
//  NetworkService.swift
//  Helper
//
//  Created by David Cheshenko on 23.02.26.
//

import Foundation

final class NetworkService: INetworkService {
    
    func getNews() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=41642d6fe8e14918b2e92d254bde5cd0"
        
        guard let url = URL(string: urlString) else {
            print("Неверный URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Ошибка: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else {
                    print("Ошибка сервера: \(httpResponse.statusCode)")
                    return
                }
            }
            
            guard let data = data else {
                print("Нет данных")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let articles = json["articles"] as? [[String: Any]] {
                    for article in articles {
                        if let title = article["title"] as? String {
                            print("Новость: \(title)")
                        }
                    }
                }
            } catch {
                print("Ошибка парсинга: \(error)")
            }
    
        }
        
        task.resume()
    }
}
