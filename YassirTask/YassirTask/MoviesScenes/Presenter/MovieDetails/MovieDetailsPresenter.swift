//
//  MovieDetailsPresenter.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Resolver

protocol MovieDetailsPresentationLogic {
    func presentResponse(_ response: MovieDetailsModel.Response)
    func presentError(_ error:  MovieDetailsModel.MovieDetailsError)
    func presentLoader(_ status: Bool)
}

final class MovieDetailsPresenter {
    
    @WeakLazyInjected var viewController: MovieDetailsDisplayLogic?
    private let transformer: MoviesTransformerProtocol = MoviesTransformer()
}


// MARK: - MovieDetailsPresentationLogic
extension MovieDetailsPresenter: MovieDetailsPresentationLogic {
    
    func presentLoader(_ status: Bool) {
        switch status {
        case true:
            viewController?.showLoading()
        case false:
            viewController?.hideLoading()
        }
    }
    
    func presentResponse(_ response: MovieDetailsModel.Response) {
        switch response {
        case .movie(movies: let movies):
            self.viewController?.displayViewModel(.movie(movie: self.transformer.transformMoviesToMoviesListUI(with: movies)))
        }
    }
    
    func presentError(_ error: MovieDetailsModel.MovieDetailsError) {
        viewController?.displayError(.init(error: error.error))
    }
}
