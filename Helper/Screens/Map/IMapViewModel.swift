//
//  IMapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import CoreLocation

protocol IMapViewModel: AnyObject {
    
    var onLocationReady: ((CLLocationCoordinate2D) -> Void)? { get set }
    var onLocationDenied: (() -> Void)? { get set }
    
    func locationButtonTapped()
    
    func requestLocationPermission()
    
}
