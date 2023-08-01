//
//  MoviesListModel.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//



import Foundation

enum MoviesListModel {
    
    enum Request {
        case getMovies
        case ReqesutMovieID(index: Int)
    }
    
    enum Response {
        case movies(movies: MoviesListDTO)
        case movieID(movieID: Int)
    }
    
    enum ViewModel {
        case moviesList(moviesList: [MoviesListUIModel])
        case requestedMovieID(movieID: Int)
    }
    
    enum Route {
        case MovieDetails(movieID: Int)
        case Error(error: String)
    }
    
    struct DataSource {
    }
    
    struct MoviesListError {
        let error: String
    }
}
