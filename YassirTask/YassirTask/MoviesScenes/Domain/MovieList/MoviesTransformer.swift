//
//  MoviesTransformer.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
protocol MoviesTransformerProtocol {
    func transformMoviesToMoviesListUI(with model: [MoviesList]) -> [MoviesListUIModel]
    func transformMoviesToMoviesListUI(with model: MoviesList) -> MoviesListUIModel
}

struct MoviesTransformer: MoviesTransformerProtocol{
    
    func transformMoviesToMoviesListUI(with model: [MoviesList]) -> [MoviesListUIModel] {
        var moviesListUIModel = [MoviesListUIModel]()
        model.forEach({ dto in
            moviesListUIModel.append(.init(title: dto.title ?? "",
                                           overView: dto.overview ?? "",
                                           image: "\(NetworkConstants.ImageURL.Imageurl.rawValue)\(dto.posterPath ?? "")"))
        })
        return moviesListUIModel
    }
    
    func transformMoviesToMoviesListUI(with model: MoviesList) -> MoviesListUIModel {
        MoviesListUIModel.init(title: model.title ?? "",
                               overView: model.overview ?? "",
                               image: "\(NetworkConstants.ImageURL.Imageurl.rawValue)\(model.posterPath ?? "")")
    }
    
}
