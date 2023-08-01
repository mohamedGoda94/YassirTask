//
//  ImageLoader.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import SDWebImage
protocol ImageLoader {
    func loadImage(with url: String)
}

extension ImageLoader where Self: UIImageView {
    func loadImage(with url: String){
        let urlString = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
}

extension UIImageView: ImageLoader{}
