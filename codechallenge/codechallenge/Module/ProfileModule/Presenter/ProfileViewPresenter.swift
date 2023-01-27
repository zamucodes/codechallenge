//
//  ProfileViewPresenter.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import Foundation

class ProfileViewPresenter {
    weak var view: ProfileViewProtocol?
    var interactor: ProfileViewInteractorProtocol?

    private var profileInfoData: [ProfileInfoModel] = [
        .init(inputField: .userName, value: "abcde"),
        .init(inputField: .firstName, value: "John"),
        .init(inputField: .lastName, value: "Wayne")
    ]
    // Initialize password data empty
    private var passwordData: [ProfileInfoModel] = [
        .init(inputField: .password, value: ""),
        .init(inputField: .confirmPassword, value: "")
    ]

    private var userInput: ProfileData?
    private var userPasswordInput: PasswordData = PasswordData(
        newPassword: "",
        newPasswordConfirmation: ""
    )

    init(interactor: ProfileViewInteractorProtocol) {
        self.interactor = interactor
    }
}

extension ProfileViewPresenter: ProfileViewPresenterProtocol {
    // MARK: - WS logic, handle responses and updates to the View
    func getUserInfo() {
        view?.showLoading()
        // TODO Call interactor get profile
    }

    func onSuccessGetProfileInfo(response: UserInfoResponse) {
        view?.hideLoading()
        userInput = response.data
        profileInfoData = profileDataToArray(response)
        view?.reloadInfo()
    }

    private func profileDataToArray(_ response: UserInfoResponse) -> [ProfileInfoModel] {
        [
            .init(inputField: .userName, value: response.data.userName),
            .init(inputField: .firstName, value: response.data.firstName),
            .init(inputField: .lastName, value: response.data.lastName)
        ]
    }

    func saveUserInfo() {
        guard let userInput = userInput else {
            return
        }

        view?.showLoading()
        // TODO Call interactor save userinfo
    }

    func saveUserPassword() {
        let passInput = userPasswordInput

        if passInput.newPassword.isEmpty
            || passInput.newPasswordConfirmation.isEmpty {
            view?.showAlert("ERROR", message: "Password cannot be empty")

        } else if passInput.newPassword != passInput.newPasswordConfirmation {
            view?.showAlert("ERROR", message: "Passwords do not match")
        } else {
            view?.showLoading()
            // TODO Call interactor save password
        }
    }

    func onSuccessUpdateProfileInfo(response: UserInfoResponse) {
        view?.hideLoading()
        view?.showAlert("SUCCESS", message: response.message)
    }

    func onSuccessUpdatePassword(response: PasswordResponse) {
        view?.hideLoading()
        view?.showAlert("SUCCESS", message: response.message)
    }

    // MARK: - Data retrieve to show in rows
    func getNumberOfProfileItems() -> Int {
        profileInfoData.count
    }

    func getProfileItem(_ idx: Int) -> ProfileInfoModel {
        profileInfoData[idx]
    }

    func getNumberOfPasswordItems() -> Int {
        passwordData.count
    }

    func getPasswordItem(_ idx: Int) -> ProfileInfoModel {
        passwordData[idx]
    }

    // MARK: - Handle inputs update
    func changeUserInfo(data: ProfileInfoModel, value: String) {
        switch data.inputField {
        case .userName:
            userInput?.userName = value
        case .firstName:
            userInput?.firstName = value
        case .lastName:
            userInput?.lastName = value
        default:
            break
        }
    }

    func changeUserPassword(data: ProfileInfoModel, value: String) {
        switch data.inputField {
        case .password:
            userPasswordInput.newPassword = value
        case .confirmPassword:
            userPasswordInput.newPasswordConfirmation = value
        default:
            break
        }
    }
}
