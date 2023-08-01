//
//  MovieDetailsModel.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//



import Foundation

enum MovieDetailsModel {
    
    enum Request {
        case GetMovieDetails
    }
    
    enum Response {
        case movie(movies: MoviesList)
    }
    
    enum ViewModel {
        case movie(movie: MoviesListUIModel)
    }
    
    enum Route {
        case Error(error: String)
    }
    
    struct DataSource: MovieDetailsModelDataSourceProtocol{
        var movieId: Int
    }
    
    struct MovieDetailsError {
        let error: String
    }
}

protocol MovieDetailsModelDataSourceProtocol {
    var movieId: Int { get }
}
