//
//  IWeatherViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

protocol IWeatherViewModel: AnyObject {
    
    var onWeatherLoaded: (([Weather]) -> Void)? { get set }
    var onError: ((String?) -> Void)? { get set }
    var weatherResponse: WeatherResponse? { get }
    func viewDidLoad()
}
