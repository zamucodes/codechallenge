//
//  ProfileInfoModel.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation

enum InputField: String {
    case userName = "Username"
    case firstName = "First Name"
    case lastName = "Last Name"
    case password = "New Password"
    case confirmPassword = "Re-enter Password"
}

struct ProfileInfoModel {
    let inputField: InputField
    let value: String
}
