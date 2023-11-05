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




// API RESPONSE DATA
    //    adult = 0;
    //    "backdrop_path" = "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg";
    //    "genre_ids" =             (
    //        27,
    //        9648
    //    );
    //    id = 507089;
    //    "media_type" = movie;
    //    "original_language" = en;
    //    "original_title" = "Five Nights at Freddy's";
    //    overview = "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.";
    //    popularity = "4637.605";
    //    "poster_path" = "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg";
    //    "release_date" = "2023-10-25";
    //    title = "Five Nights at Freddy's";
    //    video = 0;
    //    "vote_average" = "8.298999999999999";
    //    "vote_count" = 1433;
