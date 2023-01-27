//
//  UserInfoRequest.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

enum UserInfoRequest {
    case getProfile(username: String)
    case updateProfile(input: ProfileData)
}

extension UserInfoRequest: APIRequest {
    var request: URLRequest? {
        switch self {
        case .getProfile(let username):
            return request(for: "/profiles/\(username)")
        case .updateProfile:
            return request(for: "/profiles/update")
        }
    }

    var httpMethod: String {
        switch self {
        case .getProfile:
            return "GET"
        case .updateProfile:
            return "POST"
        }
    }

    var httpHeaders: [String: String]? {
        return ["AuthToken" : "fakeToken"]
    }

    var body: [String : String]? {
        switch self {
        case .updateProfile(let input):
            return ["firstName": input.firstName,
                    "lastName": input.lastName]
        default:
            return nil
        }
    }
}

extension UserInfoRequest: MockRequest {
    var mockFilename: String? {
        switch self {
        case .getProfile:
            return "userData"
        case .updateProfile:
            return "userDataUpdated"
        }
    }
}
