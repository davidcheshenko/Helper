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
    private let locationService: ILocationService
    
    // MARK: - Public properties
    
    var onWeatherLoaded: (([Weather]) -> Void)?
    var onError: ((String?) -> Void)?
    var weatherResponse: WeatherResponse?
    
    // MARK: - Lifecycle
    
    init(networkService: INetworkService, locationService: ILocationService) {
        self.networkService = networkService
        self.locationService = locationService
    }
    
    // MARK: - Public methods
    
    func viewDidLoad() {
            guard let coordinates = locationService.lastLocation else {
                self.onError?("Unable to determine your location")
                return
            }
            networkService.getWeather(lat: coordinates.latitude, lon: coordinates.longitude) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.weatherResponse = response
                    self?.onWeatherLoaded?([])
                case .failure(let error):
                    self?.onError?(self?.mapErrorToMessage(error: error))
                }
            }
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

