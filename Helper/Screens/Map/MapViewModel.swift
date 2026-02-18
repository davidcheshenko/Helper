//
//  MapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import CoreLocation

class MapViewModel: IMapViewModel {
    
    var onUserLocation: ((CLLocationCoordinate2D?) -> Void)?
    var onLocationDenied: (() -> Void)?
    var onLocationAlert: ((LocationState) -> Void)?
    
    private let locationService: ILocationService
    
    init(locationService: ILocationService) {
        self.locationService = locationService
    }
    
    func viewDidLoad() {
        locationService.requestPermissions()
    }
    
    func checkUserLocation() {
        guard locationService.isGeoAllowedAndShowAlertIfNeeded() else {
            onLocationDenied?()
            return
        }
        onUserLocation?(locationService.lastLocation)
    }
}
