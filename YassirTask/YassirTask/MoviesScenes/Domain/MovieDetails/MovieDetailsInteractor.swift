//
//  MovieDetailsInteractor.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import Resolver

typealias MovieDetailsInteractable = MovieDetailsBusinessLogic & MovieDetailsDataStore

protocol MovieDetailsBusinessLogic {
    func doRequest(_ request: MovieDetailsModel.Request)
}

protocol MovieDetailsDataStore {
    var dataSource: MovieDetailsModel.DataSource { get }
}

final class MovieDetailsInteractor: MovieDetailsDataStore {
    
    @Injected var dataSource: MovieDetailsModel.DataSource
    @Injected var presenter: MovieDetailsPresentationLogic
    @Injected var service: MovieDetailsServiceProtocol
}


// MARK: - MovieDetailsBusinessLogic
extension MovieDetailsInteractor: MovieDetailsBusinessLogic {
    
    func doRequest(_ request: MovieDetailsModel.Request) {
        self.presenter.presentLoader(true)
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {return}
            switch request {
            case .GetMovieDetails:
                self.getMovie(request: .init(movieId: self.dataSource.movieId))
            }
        }
    }
}


// MARK: - Private Zone
private extension MovieDetailsInteractor {
    private func getMovie(request: RequestMovieDetails){
        self.service.getMovieDetails(request: request) { [weak self] (result) in
            guard let self = self else {return}
            self.presenter.presentLoader(false)
            switch result {
            case .success(let response):
                self.presenter.presentResponse(.movie(movies: response))
            case .failure(let error):
                self.presenter.presentError(.init(error: error.localizedDescription))
            }
        }
    }
}
