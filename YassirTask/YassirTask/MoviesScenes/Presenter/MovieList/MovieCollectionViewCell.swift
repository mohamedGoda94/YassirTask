//
//  MovieCollectionViewCell.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, NibBased{

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverView: UILabel!
    
    func configCell(with model: MoviesListUIModel){
        movieImageView.loadImage(with: model.image)
        movieTitle.text = model.title
        movieOverView.text = model.overView
    }
}
