//
//  ILocationService.swift
//  Helper
//
//  Created by David Cheshenko on 19.01.26.
//

import Foundation
import CoreLocation

protocol ILocationService {
    
    var lastLocation: CLLocationCoordinate2D? { get }
    
    func requestPermissions()
    func isGeoAllowedAndShowAlertIfNeeded() -> Bool
}
