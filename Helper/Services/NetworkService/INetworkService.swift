//
//  INetworkService.swift
//  Helper
//
//  Created by David Cheshenko on 23.02.26.
//

import Foundation

protocol INetworkService {

    func getNews(completion: @escaping NewsCompletion )
    func getWeather(lat: Double, lon: Double, completion: @escaping WeatherCompletion ) 
}
