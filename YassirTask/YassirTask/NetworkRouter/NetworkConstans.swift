//
//  NetworkConstans.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
enum NetworkConstants{
    enum BaseURL: String{
        case BaseURL = "https://api.themoviedb.org/3/"
    }
    enum UrlPath: String{
        case GetMovies = "discover/movie"
        case GetMovieDetails = "movie/"
    }
    enum APIKey: String{
        case APIKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    }
    enum ImageURL: String{
        case Imageurl = "https://image.tmdb.org/t/p/original"
    }
}
