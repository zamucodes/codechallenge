//
//  ProfileViewController+InputTextCellDelegate.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import UIKit

extension ProfileViewController: InputTextCellDelegate {
    func tableViewCell(valueChangedIn textField: UITextField, data: ProfileInfoModel) {
        switch data.inputField {
        case .userName, .firstName, .lastName:
            presenter?.changeUserInfo(data: data, value: textField.text ?? "")
        case .password, .confirmPassword:
            presenter?.changeUserPassword(data: data, value: textField.text ?? "")
        }
    }
}
