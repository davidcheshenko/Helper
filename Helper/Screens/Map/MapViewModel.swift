//
//  MapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation

class MapViewModel: IMapViewModel {
    
    private let locationService: ILocationService
    
    init(locationService: ILocationService) {
        self.locationService = locationService
    }
}
