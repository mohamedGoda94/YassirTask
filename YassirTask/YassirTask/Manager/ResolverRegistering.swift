//
//  ResolverRegistering.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Resolver
import Moya

extension Resolver{
    static func registerServices() {
        register { CodableTransformer() }
        .implements(DataTransformer.self)
        
        register { MoyaProvider<NetworkRouter>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]) }
    }
}

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerServices()
        registerMoviesListScreen()
        registerMovieDetailsScreen()
    }
}
