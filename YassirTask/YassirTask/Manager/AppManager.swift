//
//  AppManager.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
import Resolver

struct AppManager {
    
    func startApp(window: UIWindow?) {
        let moviesListViewController: MoviesListViewController = Resolver.resolve()
        let navigationController = UINavigationController(rootViewController: moviesListViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
