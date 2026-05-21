//
//  Constants.swift
//  Helper
//
//  Created by David Cheshenko on 26.02.26.
//

import Foundation

typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias NewsCompletion = (Result<[Article]?, Error>) -> ()
typealias WeatherCompletion = (Result<WeatherResponse, Error>) -> Void

class Constants {
    static let apiKeyNews = "41642d6fe8e14918b2e92d254bde5cd0"
    static let newsBaseUrl = "https://newsapi.org/v2/"
    static let identifier = "NewsCell"
    static let apiKeyWeather = "4d920f27707f0d437a34c4db31b5cd1a"
    static let weatherBaseUrl = "https://api.openweathermap.org/data/2.5/"
}
