//
//  APICaller.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 04/11/23.
//

import Foundation

struct Constants {
    
    // these are the authentication keys
    static let API_KEY = "30176ea7a9f4ad826804e004bf3b843d"
    static let ACCESS_TOKEN_AUTH = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZWM4NGRmN2M4ZDQ1Nzc3ZWJiNjBjMWI1ZDUxOTlmZCIsInN1YiI6IjY1NDYxNjE1ZmQ0ZjgwMDEwMWI1ODBmYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aOSIJcRh_aRXoRl88kPbQE1227PQxS5PwSWDlMxH03I"
    // this is the base url
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}


class APICaller {
    static let shared = APICaller()
    
    //having a completion callback function
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data , _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                //print(results)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        // task is by default created in the pause status so we resume it
        task.resume()
        
    }
    
}
