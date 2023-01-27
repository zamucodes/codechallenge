//
//  UserInfoResponse.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

struct UserInfoResponse: Codable {
    let message: String
    let data: ProfileData
}

struct ProfileData: Codable {
    var firstName: String
    var userName: String
    var lastName: String
}
