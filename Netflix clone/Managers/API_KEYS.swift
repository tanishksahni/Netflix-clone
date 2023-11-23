//
//  API_KEYS.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 21/11/23.
//

// API_KEYS.swift
import Foundation

public enum API_KEYS {
    
    enum Keys {
        static let tmdbApiKey = "TMDBAPI_KEY"
        static let youtubeApiKey = "YoutubeAPI_KEY"
    }
    
    // Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    // Get API keys from plist
    static let tmdbApiKey: String = {
        guard let apiKeyString = API_KEYS.infoDictionary[Keys.tmdbApiKey] as? String else {
            fatalError("TMDB API Key not set in plist")
        }
        return apiKeyString
    }()
    
    static let youtubeApiKey: String = {
        guard let apiKeyString = API_KEYS.infoDictionary[Keys.youtubeApiKey] as? String else {
            fatalError("YouTube API Key not set in plist")
        }
        return apiKeyString
    }()
}
