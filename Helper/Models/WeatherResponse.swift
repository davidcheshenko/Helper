//
//  WeatherResponse.swift
//  Helper
//
//  Created by David Cheshenko on 21.05.26.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String?
    let main: MainInfo?
    let weather: [Weather]?
    let wind: Wind?
}

struct MainInfo: Codable {
    let temp: Double?
    let humidity: Int?
}

struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
    var systemIconName: String {
        switch icon {
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.stars.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d", "03n", "04d", "04n":
            return "cloud.fill"
        case "09d", "09n":
            return "cloud.drizzle.fill"
        case "10d":
            return "cloud.sun.rain.fill"
        case "10n":
            return "cloud.moon.rain.fill"
        case "11d", "11n":
            return "cloud.bolt.rain.fill"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "cloud.fog.fill"
        default:
            return "cloud.fill"
        }
    }
}

struct Wind: Codable {
    let speed: Double?
}
