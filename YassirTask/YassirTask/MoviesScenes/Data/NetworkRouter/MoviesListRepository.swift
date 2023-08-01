//
//  MoviesListRepository.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Resolver
import Moya

protocol MoviesListRepositoryProtocol {
    func getMovies(completion: @escaping (Result<MoviesListDTO, MoviesError>) -> Void)
    func getMovieDetails(request:RequestMovieDetails, completion: @escaping (Result<MoviesList, MoviesError>) -> Void)
}

class MoviesListRepository: MoviesListRepositoryProtocol {
    
    @Injected var dataTransformer: DataTransformer
    @Injected var networkRouter: MoyaProvider<NetworkRouter>
    
    func getMovies(completion: @escaping (Result<MoviesListDTO, MoviesError>) -> Void) {
        networkRouter.request(.GetMovies) { result in
            switch result {
            case.success(let response):
                self.handleMoviesResponse(with: response, completion: completion)
            case.failure(let error):
                completion(.failure(.Error(error: error.localizedDescription)))
            }
        }
    }
    
    func getMovieDetails(request: RequestMovieDetails, completion: @escaping (Result<MoviesList, MoviesError>) -> Void) {
        networkRouter.request(.GetMovieDetails(movieID: request.movieId)) { result in
            switch result {
            case.success(let response):
                self.handleMovieDetailsResponse(with: response, completion: completion)
            case.failure(let error):
                completion(.failure(.Error(error: error.localizedDescription)))
            }
        }
    }
    
    
    private func handleMoviesResponse(with response: Response, completion: @escaping (Result<MoviesListDTO, MoviesError>) -> Void){
        switch response.statusCode {
        case 200:
            guard let moviesDTO = self.dataTransformer.decodeObject(from: response.data, to: MoviesListDTO.self, with: nil) else {
                completion(.failure(.Error(error: "decoding error")))
                return
            }
            completion(.success(moviesDTO))
        default:
            completion(.failure(.Error(error: "decoding error")))
        }
    }
    
    private func handleMovieDetailsResponse(with response: Response, completion: @escaping (Result<MoviesList, MoviesError>) -> Void){
        switch response.statusCode {
        case 200:
            guard let moviesDTO = self.dataTransformer.decodeObject(from: response.data, to: MoviesList.self, with: nil) else {
                completion(.failure(.Error(error: "decoding error")))
                return
            }
            completion(.success(moviesDTO))
        default:
            completion(.failure(.Error(error: "decoding error")))
        }
    }
}
