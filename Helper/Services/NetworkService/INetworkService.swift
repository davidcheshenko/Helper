//
//  INetworkService.swift
//  Helper
//
//  Created by David Cheshenko on 23.02.26.
//

import Foundation

protocol INetworkService {

    func getNews(completion: @escaping NewsCompletion )
    func getWeather(completion: @escaping WeatherCompletion ) 
}
