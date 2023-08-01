//
//  MoviesListInteractor.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import Resolver

typealias MoviesListInteractable = MoviesListBusinessLogic & MoviesListDataStore

protocol MoviesListBusinessLogic {
    func doRequest(_ request: MoviesListModel.Request)
}

protocol MoviesListDataStore {
    var dataSource: MoviesListModel.DataSource { get }
}

final class MoviesListInteractor: MoviesListDataStore {
    
    var dataSource: MoviesListModel.DataSource
    private(set) var movies: MoviesListDTO
    
    @Injected var presenter: MoviesListPresentationLogic
    @Injected var service: MoviesListServiceProtocol

    init(dataSource: MoviesListModel.DataSource) {
        self.dataSource = dataSource
        self.movies = MoviesListDTO()
    }
}


// MARK: - MoviesListBusinessLogic
extension MoviesListInteractor: MoviesListBusinessLogic {
    
    func doRequest(_ request: MoviesListModel.Request) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {return}
            switch request {
            case .getMovies:
                self.getMovies()
            case .ReqesutMovieID(index: let index):
                self.presenter.presentResponse(.movieID(movieID: self.movies.results?[index].id ?? 0))
            }
        }
    }
}


// MARK: - Private Zone
private extension MoviesListInteractor {
    private func getMovies(){
        self.presenter.presentLoader(true)
        self.service.getMovies { [weak self] (result) in
            guard let self = self else {return}
            self.presenter.presentLoader(false)
            switch result {
            case .success(let response):
                self.movies = response
                self.presenter.presentResponse(.movies(movies: response))
            case .failure(let error):
                self.presenter.presentError(.init(error: error.localizedDescription))
            }
        }
    }
}
