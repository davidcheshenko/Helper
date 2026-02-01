//
//  Tabs.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import UIKit

enum Tabs: String, CaseIterable {
    
    case news
    case map
    case weather
    case profile
    
    var image: UIImage? {
        switch self {
            
        case .news:
            return UIImage(named: "newsItem")
        case .map:
            return UIImage(named: "mapItem")
        case .weather:
            return UIImage(named: "weatherItem")
        case .profile:
            return UIImage(named: "profileItem")
        }
    }
}
