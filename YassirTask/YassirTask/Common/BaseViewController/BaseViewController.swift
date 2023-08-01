//
//  BaseViewController.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import UIKit

protocol LoadableProtocol {
    func showLoading()
    func hideLoading()
}

class BaseViewController: UIViewController {
    
    private var indicator = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Base Protocol implementation
extension BaseViewController: LoadableProtocol {
    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.indicator.center = self.view.center
            self.view.addSubview(self.indicator)
            self.indicator.startAnimating()
        }
    }

    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.indicator.stopAnimating()
            self.indicator.removeFromSuperview()
        }
    }
}
