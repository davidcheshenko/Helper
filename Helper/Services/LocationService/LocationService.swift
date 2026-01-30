//
//  LocationService.swift
//  Helper
//
//  Created by David Cheshenko on 19.01.26.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, ILocationService {
    
    var lastLocation: CLLocationCoordinate2D?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestPermissions() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    func isGeoAllowedAndShowAlertIfNeeded() -> Bool {
        let status = locationManager.authorizationStatus
        return status == .authorizedWhenInUse || status == .authorizedAlways
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            lastLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last?.coordinate
    }
    
    func  locationManager(_ manager : CLLocationManager, didFailWithError error : Error) {
        print("📍 Location Manager failed: \(error)")
    }
}
