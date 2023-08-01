//
//  MoviesListService.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Resolver

protocol MoviesListServiceProtocol {
    func getMovies(completion: @escaping (Result<MoviesListDTO, MoviesError>) -> Void)
}

final class MoviesListService: MoviesListServiceProtocol {

    @Injected var moviesListRepository: MoviesListRepositoryProtocol
    
    func getMovies(completion: @escaping (Result<MoviesListDTO, MoviesError>) -> Void) {
        moviesListRepository.getMovies(completion: completion)
    }
}
