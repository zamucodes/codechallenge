//
//  MockAPIManager.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

class MockAPIManager: APIManagerProtocol {
    private let parser: JsonParser

    init(parser: JsonParser = JsonParser()) {
        self.parser = parser
    }

    func request<T: Decodable>(_ request: APIRequest, completion: @escaping Response<T>) {
        guard let request = request as? MockRequest else {
            completion(.failure(.invalidRequest))
            return
        }

        guard let data = request.mockData() else {
            completion(.failure(.dataNotFound))
            return
        }

        // Add delay to simulate response latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.parser.json(data: data, completion: completion)
        })
    }
}

protocol MockRequest: APIRequest {
    var mockFilename: String? { get }
}

extension MockRequest {
    func mockData() -> Data? {
        guard let mockFileUrl = Bundle.main.url(forResource: mockFilename, withExtension: "json"),
            let mockData = try? Data(contentsOf: mockFileUrl) else {
                return nil
        }
        return mockData
    }
}
