//
//  YoutubeSearchResponse.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 14/11/23.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
