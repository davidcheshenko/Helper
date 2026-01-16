//
//  IMapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import MapKit

protocol IMapViewModel {
    
    var onRegionChanged: ((MKCoordinateRegion) -> Void)? { get set }
        func viewDidLoad()
}
