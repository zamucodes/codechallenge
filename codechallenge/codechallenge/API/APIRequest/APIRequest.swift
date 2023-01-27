//
//  APIRequest.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

protocol APIRequest {
    var request: URLRequest? { get }
    var httpMethod: String { get }
    var httpHeaders: [String : String]? { get }
    var body: [String : String]? { get }
    var scheme: String { get }
    var host: String { get }
}

extension APIRequest {
    func request(for path: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod

        if let httpHeaders = httpHeaders {
            for (key, value) in httpHeaders {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let body = body {
            do {
                let data = try JSONSerialization.data(withJSONObject: body)
                request.httpBody = data
            } catch (_) {
                print("Body couldn't be parsed")
            }
        }

        return request
    }
}

// Default values for request
extension APIRequest {
    var scheme: String {
        return "https://"
    }

    var host: String {
        return "api.foo.com"
    }
}
