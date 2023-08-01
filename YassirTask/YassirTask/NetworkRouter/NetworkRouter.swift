//
//  NetworkRouter.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
import Moya

enum NetworkRouter {
    case GetMovies
    case GetMovieDetails(movieID: Int)
}

extension NetworkRouter: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConstants.BaseURL.BaseURL.rawValue)!
    }
    
    var path: String {
        switch self {
        case .GetMovies:
            return NetworkConstants.UrlPath.GetMovies.rawValue
        case .GetMovieDetails(movieID: let movieID):
            return "\(NetworkConstants.UrlPath.GetMovieDetails.rawValue)\(movieID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: ["api_key": NetworkConstants.APIKey.APIKey.rawValue],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
          return JSONEncoding.default
      }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

