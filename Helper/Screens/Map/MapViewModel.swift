//
//  MapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import CoreLocation

class MapViewModel: IMapViewModel {
    
    //MARK: - Public properties
    
    var onUserLocation: ((CLLocationCoordinate2D?) -> Void)?
    var onLocationDenied: (() -> Void)?
    var onLocationAlert: ((LocationState) -> Void)?
    
    // MARK: - Private properties
    
    private let locationService: ILocationService
    
    // MARK: - Lifecycle
    
    init(locationService: ILocationService) {
        self.locationService = locationService
    }
    
    // MARK: - Public methods
    
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
