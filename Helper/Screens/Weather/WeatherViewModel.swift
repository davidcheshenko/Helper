//
//  WeatherViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

class WeatherViewModel: IWeatherViewModel {

    // MARK: - Private properties
    
    private let networkService: INetworkService
    
    // MARK: - Public properties
    
    var onWeatherLoaded: (([Weather]) -> Void)?
    var onError: ((String?) -> Void)?
    var weatherResponse: WeatherResponse?
    
    // MARK: - Lifecycle
    
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        networkService.getWeather { [weak self] result in
            switch result {
            case .success(let response):
                self?.weatherResponse = response 
                guard let weather = response.weather else {
                    self?.onError?("Failed to load weather")
                    return
                }
                self?.onWeatherLoaded?(weather)
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

private extension WeatherViewModel {
    
    func mapErrorToMessage(error: Error) -> String {
        if (error as NSError).domain == NSURLErrorDomain && (error as NSError).code == NSURLErrorNotConnectedToInternet {
            return "No internet connection"
        }
        return "Failed to load weather"
    }
}

