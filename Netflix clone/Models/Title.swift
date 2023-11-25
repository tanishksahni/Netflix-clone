//
//  Movie.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 05/11/23.
//

import Foundation


// Codable protocol: is an alias for encoder and decoder protocol
struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
