//
//  WeatherResponse.swift
//  Helper
//
//  Created by David Cheshenko on 21.05.26.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let discription: String
}
