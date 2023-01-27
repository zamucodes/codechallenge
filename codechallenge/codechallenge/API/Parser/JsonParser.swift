//
//  JsonParser.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

typealias Response<T> = (Result<T, APIErrorType>) -> Void

enum APIErrorType: Error {
    case invalidRequest
    case dataNotFound
    case responseError(error: Error)
    case parsingError(error: Error)
}

protocol JsonParserProtocol {
    func json<T: Decodable>(data: Data, completion: @escaping Response<T>)
}

struct JsonParser {
    let jsonDecoder = JSONDecoder()

    func json<T: Decodable>(data: Data, completion: @escaping Response<T>) {
        do {
            let result: T = try jsonDecoder.decode(T.self, from: data)
            completion(.success(result))
        } catch let error {
            completion(.failure(.parsingError(error: error)))
        }
    }
}
