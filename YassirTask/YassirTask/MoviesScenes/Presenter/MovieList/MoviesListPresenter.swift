//
//  MoviesListPresenter.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Resolver

protocol MoviesListPresentationLogic {
    func presentResponse(_ response: MoviesListModel.Response)
    func presentError(_ error:  MoviesListModel.MoviesListError)
    func presentLoader(_ status: Bool)
}

final class MoviesListPresenter {
    
    @WeakLazyInjected var viewController: MoviesListDisplayLogic?
    private let transformer: MoviesTransformerProtocol = MoviesTransformer()
}


// MARK: - MoviesListPresentationLogic
extension MoviesListPresenter: MoviesListPresentationLogic {
    func presentLoader(_ status: Bool) {
        switch status {
        case true:
            viewController?.showLoading()
        case false:
            viewController?.hideLoading()
        }
    }
    
    func presentResponse(_ response: MoviesListModel.Response) {
        switch response {
        case .movies(movies: let movies):
            viewController?.displayViewModel(.moviesList(moviesList: self.transformer.transformMoviesToMoviesListUI(with: movies.results ?? [])))
        case .movieID(movieID: let movieID):
            viewController?.displayViewModel(.requestedMovieID(movieID: movieID))
        }
    }
    
    func presentError(_ error: MoviesListModel.MoviesListError) {
        viewController?.displayError(.init(error: error.error))
    }
}
