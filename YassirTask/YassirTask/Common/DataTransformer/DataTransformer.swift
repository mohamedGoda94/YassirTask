//
//  DataTransformer.swift
//  YassirTask
//
//  Created by Mohamed Goda on 01/08/2023.
//

import Foundation
protocol DataTransformer {
    func encodeObject<T: Codable>(from model: T) -> Data?
    func decodeObject<T: Codable>(from json: Data,to model: T.Type,with strategy: JSONDecoder.KeyDecodingStrategy?) -> T?
}
