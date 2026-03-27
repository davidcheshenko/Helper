//
//  NewsResponse.swift
//  Helper
//
//  Created by David Cheshenko on 25.03.26.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable{
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

