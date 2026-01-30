//
//  ServiceFactory.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import Foundation

class ServiceFactory: IServiceFactory {
    
    var locationService: ILocationService
    
    init() {
        self.locationService = LocationService()
    }
}
