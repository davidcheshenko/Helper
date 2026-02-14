//
//  MapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import CoreLocation

class MapViewModel: IMapViewModel {
    
    var onLocationReady: ((CLLocationCoordinate2D) -> Void)?
    var onLocationDenied: (() -> Void)?
    
    private let locationService: ILocationService
    
    init(locationService: ILocationService) {
        self.locationService = locationService
    }
    
    func requestLocationPermission() {
        locationService.requestPermissions()
    }
    func locationButtonTapped() {
        
        if locationService.isGeoAllowedAndShowAlertIfNeeded() {
            
            if let coordinate = locationService.lastLocation {
                onLocationReady?(coordinate)
            }
            
        } else {
            onLocationDenied?()
        }
    }
}
