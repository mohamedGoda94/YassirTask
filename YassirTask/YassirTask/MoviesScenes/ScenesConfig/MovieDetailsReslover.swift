//
//  MovieDetailsReslover.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import Resolver


extension Resolver {
    static func registerMovieDetailsScreen() {
        
        register { MovieDetailsViewController() }
        .resolveProperties { resolver, service in
            resolver.resolve(MovieDetailsRouter.self).viewController = service
            resolver.resolve(MovieDetailsPresenter.self).viewController = service
        }
        .implements(MovieDetailsDisplayLogic.self)
        
        register { MovieDetailsRouter() }
        .implements(MovieDetailsRouting.self)
        
        register { MovieDetailsInteractor()}
        .implements(MovieDetailsInteractable.self)
                
        register { MovieDetailsPresenter() }
        .implements(MovieDetailsPresentationLogic.self)
                
        register { MovieDetailsService() }
        .implements(MovieDetailsServiceProtocol.self)
    }
}

