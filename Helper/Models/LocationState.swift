//
//  LocationState.swift
//  Helper
//
//  Created by David Cheshenko on 18.02.26.
//

import Foundation
import UIKit

enum LocationState {
    
    case locationDenied
    case locationNotFound
    
    var message: String {
        switch self {
        case .locationDenied:
            return "We use location to show your current position on the map."
        case .locationNotFound:
            return "Could not determine your location"
        }
    }
    
    var title: String? {
        switch self {
        case .locationDenied:
            return "Go to settings"
        case .locationNotFound:
            return nil
        }
    }
    
    var cancelAction: UIAlertAction {
        UIAlertAction(title: "Cancel", style: .cancel)
        
    }
}
