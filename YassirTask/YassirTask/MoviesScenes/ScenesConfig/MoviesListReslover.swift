//
//  MoviesListReslover.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import Resolver
import Moya
extension Resolver {
    static func registerMoviesListScreen() {
        
        register { MoviesListViewController() }
        .resolveProperties { resolver, service in
            resolver.resolve(MoviesListRouter.self).viewController = service
            resolver.resolve(MoviesListPresenter.self).viewController = service
        }
        .implements(MoviesListDisplayLogic.self)
        
        register { MoviesListRouter() }
        .implements(MoviesListRouting.self)
        
        register { MoviesListInteractor(dataSource: MoviesListModel.DataSource()) }
        .implements(MoviesListInteractable.self)
        
        register { MoviesListPresenter() }
        .implements(MoviesListPresentationLogic.self)
                
        register { MoviesListService() }
        .implements(MoviesListServiceProtocol.self)
               
        register { MoviesListRepository() }
        .implements(MoviesListRepositoryProtocol.self)
    }
}
