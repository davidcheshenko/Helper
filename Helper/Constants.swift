//
//  Constants.swift
//  Helper
//
//  Created by David Cheshenko on 26.02.26.
//

import Foundation

typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias NewsCompletion = (Result<[Article]?, Error>) -> ()

class Constants {
    static let apiKeyNews = "41642d6fe8e14918b2e92d254bde5cd0"
    static let newsBaseUrl = "https://newsapi.org/v2/"
}
