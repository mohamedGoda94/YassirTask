//
//  MovieDetailsViewController.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import Resolver

protocol MovieDetailsDisplayLogic where Self: BaseViewController {
    func displayViewModel(_ viewModel: MovieDetailsModel.ViewModel)
    func displayError(_ error: MovieDetailsModel.MovieDetailsError)
}

final class MovieDetailsViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    // MARK: - Properties
    @Injected var interactor: MovieDetailsInteractable
    @Injected var router: MovieDetailsRouting

    // MARK: - Scene Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.doRequest(.GetMovieDetails)
    }
    
    private func setupUIData(with movie: MoviesListUIModel){
        movieTitle.text = movie.title
        movieDescription.text = movie.overView
        movieImageView.loadImage(with: movie.image)
    }
}

// MARK: - MovieDetailsDisplayLogic
extension MovieDetailsViewController: MovieDetailsDisplayLogic {
    func displayViewModel(_ viewModel: MovieDetailsModel.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            switch viewModel {
            case .movie(movie: let movie):
                self.setupUIData(with: movie)
            }
        }
    }
    
    func displayError(_ error: MovieDetailsModel.MovieDetailsError) {
        router.routeTo(.Error(error: error.error))
    }
}
