//
//  ArticlesDataTransferObject.swift
//  NYTask
//
//  Created by Mohamed Goda on 02/01/2022.
//

import Foundation

// MARK: - ArticlesDataTransferObject
struct MoviesListDTO: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [MoviesList]?
    
    internal init(status: String? = nil, copyright: String? = nil, numResults: Int? = nil, results: [MoviesList]? = nil) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct MoviesList: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
