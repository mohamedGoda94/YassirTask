//
//  MovieDetailsService.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Resolver

protocol MovieDetailsServiceProtocol {
    func getMovieDetails(request:RequestMovieDetails, completion: @escaping (Result<MoviesList, MoviesError>) -> Void)
}

final class MovieDetailsService: MovieDetailsServiceProtocol {

    @Injected var moviesListRepository: MoviesListRepositoryProtocol
    
    func getMovieDetails(request: RequestMovieDetails, completion: @escaping (Result<MoviesList, MoviesError>) -> Void) {
        moviesListRepository.getMovieDetails(request: request, completion: completion)
    }
}
