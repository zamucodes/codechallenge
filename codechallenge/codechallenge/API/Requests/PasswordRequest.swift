//
//  PasswordRequest.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

enum PasswordEndpoint {
    case updatePassword(input: PasswordData)
}

extension PasswordEndpoint: APIRequest {

    var request: URLRequest? {
        switch self {
        case .updatePassword:
            return request(for: "/password/change")
        }
    }

    var httpMethod: String {
        switch self {
        case .updatePassword:
            return "POST"
        }
    }

    var httpHeaders: [String: String]? {
        return ["AuthToken" : "fakeToken"]
    }

    var body: [String : String]? {
        switch self {
        case .updatePassword(let input):
            return [
                "currentPassword": input.currentPassword,
                "newPassword": input.newPassword,
                "confirmPassword": input.newPasswordConfirmation
            ]
        }
    }
}

extension PasswordEndpoint: MockRequest {
    var mockFilename: String? {
        return "userPasswordUpdated"
    }
}
