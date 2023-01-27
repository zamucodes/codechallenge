//
//  PasswordResponse.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

struct PasswordResponse: Codable {
    let message: String
    let data: ProfileData?
    let code: String
    let exceptionName: String?
}

struct PasswordData: Codable {
    var currentPassword: String = ""
    var newPassword: String
    var newPasswordConfirmation: String
}
