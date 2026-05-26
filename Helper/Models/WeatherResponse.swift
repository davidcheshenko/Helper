//
//  WeatherResponse.swift
//  Helper
//
//  Created by David Cheshenko on 21.05.26.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String?
    let main: Main?
    let weather: [Weather]?
    let wind: Wind?

}

struct Main: Codable {
    let temp: Double?
    let humidity: Int?
}

struct Weather: Codable {
    let name: String?
    let temp: Double?
    let description: String?
    let urlToImage: String?

}

struct Wind: Codable {
    let speed: Double? 
}
