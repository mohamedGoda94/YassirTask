//
//  MoviesListRouter.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import Resolver

protocol MoviesListRouting {
  
  func routeTo(_ route: MoviesListModel.Route)
}

final class MoviesListRouter {
  
    @WeakLazyInjected var viewController: UIViewController?
}


// MARK: - MoviesListRouting
extension MoviesListRouter: MoviesListRouting {
  
  func routeTo(_ route: MoviesListModel.Route) {
    DispatchQueue.main.async { [weak self] in
        guard let self = self else {return}
      switch route {
      case .Error(error: let error):
          self.showError(with: error)
      case .MovieDetails(movieID: let movieID):
          Resolver.register {MovieDetailsModel.DataSource(movieId: movieID)}
              .implements(MovieDetailsModelDataSourceProtocol.self)
          let moviesListViewController: MovieDetailsViewController = Resolver.resolve()
          self.viewController?.navigationController?.pushViewController(moviesListViewController, animated: true)

      }
    }
  }
    private func showError(with errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.viewController?.present(alert, animated: true, completion: nil)
    }
}
