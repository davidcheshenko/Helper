//
//  ServiceFactory.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import UIKit

class ModuleFactory: IModuleFactory {
    
    private let services: ServiceContainer
    
    init(services: ServiceContainer) {
        self.services = services
    }
    
    func makeNewsViewController() -> UIViewController {
        NewsViewController(viewModel: NewsViewModel())
    }
    
    func makeMapViewController() -> UIViewController {
        MapViewController(viewModel: MapViewModel(locationService: services.locationService))
    }
    
    func makeWeatherViewController() -> UIViewController {
        WeatherViewController(viewModel: WeatherViewModel())
    }
    
    func makeProfileViewController() -> UIViewController {
        ProfileViewController(viewModel: ProfileViewModel())
    }
}
