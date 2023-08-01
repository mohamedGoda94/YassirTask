//
//  MoviesListViewController.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import Resolver

protocol MoviesListDisplayLogic where Self: BaseViewController {
    func displayViewModel(_ viewModel: MoviesListModel.ViewModel)
    func displayError(_ error: MoviesListModel.MoviesListError)
}

final class MoviesListViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    @Injected var interactor: MoviesListInteractable
    @Injected var router: MoviesListRouting
    private(set) var movies: [MoviesListUIModel] = []

    // MARK: - Scene Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setupCollectionView()
        interactor.doRequest(.getMovies)
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self)
    }
    
}

// MARK: - MoviesListDisplayLogic
extension MoviesListViewController: MoviesListDisplayLogic {
    func displayError(_ error: MoviesListModel.MoviesListError) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.router.routeTo(.Error(error: error.error))
        }
    }
    
    func displayViewModel(_ viewModel: MoviesListModel.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            switch viewModel {
            case .moviesList(moviesList: let moviesList):
                self.movies = moviesList
                self.collectionView.reloadData()
            case .requestedMovieID(movieID: let movieID):
                self.router.routeTo(.MovieDetails(movieID: movieID))
            }
        }
    }
}

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configCell(with: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.doRequest(.ReqesutMovieID(index: indexPath.row))
    }
}
