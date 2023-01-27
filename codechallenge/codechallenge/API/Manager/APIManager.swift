//
//  APIManager.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import UIKit

protocol APIManagerProtocol {
    func request<T: Decodable>(_ request: APIRequest, completion: @escaping Response<T>)
}

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    private let parser: JsonParser

    init(urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default),
         parser: JsonParser = JsonParser()) {
        self.urlSession = urlSession
        self.parser = parser
    }

    func request<T: Decodable>(_ request: APIRequest, completion: @escaping Response<T>) {
        guard let request = request.request else {
            completion(.failure(.invalidRequest))
            return
        }

        let task = urlSession.dataTask(with: request) { [unowned self] (data, response, error) in
            if let error = error {
                completion(.failure(.responseError(error: error)))
                return
            }

            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }

            parser.json(data: data, completion: completion)
        }

        task.resume()
    }
}
