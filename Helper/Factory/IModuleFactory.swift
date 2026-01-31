//
//  IModuleFactory.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import MapKit

protocol IModuleFactory {
    
    func makeNewsViewController() -> UIViewController
    func makeMapViewController() -> UIViewController
    func makeWeatherViewController() -> UIViewController
    func makeProfileViewController() -> UIViewController
}
