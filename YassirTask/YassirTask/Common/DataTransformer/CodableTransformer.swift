//
//  CodableTransformer.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
struct CodableTransformer: DataTransformer{
    
    func encodeObject<T: Codable>(from model: T) -> Data?{
        let jsonEncoder = JSONEncoder()
        let encodedModel = try? jsonEncoder.encode(model)
        return encodedModel
    }
    
    func decodeObject<T: Codable>(from json: Data,to model: T.Type,with strategy: JSONDecoder.KeyDecodingStrategy? = nil) -> T?{
        let jsonDecoder = JSONDecoder()
        if let strategy = strategy{ jsonDecoder.keyDecodingStrategy = strategy }
        let decodedModel = try? jsonDecoder.decode(model, from: json)
        if decodedModel == nil{
            print("Failed In Decoding Model : \(model)")
            print("Failed In Decoding Data : \(String(describing: String(data: json, encoding: .utf8)))")
        }else{
            print("Decoded Model : \(decodedModel!)")
        }
        return decodedModel
    }
}
