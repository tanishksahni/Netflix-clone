//
//  APICaller.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 04/11/23.
//

import Foundation

struct Constants {
    // this is the base url
    static let baseURL = "https://api.themoviedb.org"
    // this is the youtube api key
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}


class APICaller {
    static let shared = APICaller()
    
    //having a completion callback function
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Keys.TMDBAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Keys.TMDBAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    //having a completion callback function
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Keys.TMDBAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    //having a completion callback function
    func getPopular (completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Keys.TMDBAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    //having a completion callback function
    func getTopRated (completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Keys.TMDBAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Keys.TMDBAPI_KEY)&language=en-US&sort_by=popularity.desc&include_adult=true&include_video=false&page=1&with_watch_monetization_types=flatrate") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Keys.TMDBAPI_KEY)&query=\(query)") else{return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
    }
    
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Keys.YoutubeAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
                }
                catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                    
                }
            }
            // task is by default created in the pause status so we resume it
            task.resume()
    }
}
 
