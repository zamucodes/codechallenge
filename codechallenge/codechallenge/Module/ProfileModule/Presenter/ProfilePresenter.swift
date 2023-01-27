//
//  ProfilePresenter.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Combine
import SwiftUI

class ProfilePresenter: ObservableObject {

    private let interactor: ProfileInteractor
    var view: ProfileView?
    @Published var profileInfoData: [ProfileInfoModel] = []
    @Published var passwordData: [ProfileInfoModel] = []

    private var userInput: ProfileData?
    private var userPasswordInput: PasswordData = PasswordData(
        newPassword: "",
        newPasswordConfirmation: ""
    )

    init(interactor: ProfileInteractor) {
        self.interactor = interactor
    }

    func getUserInfo(for username: String) {
        interactor.getProfile(for: username)
    }

    func saveUserInfo() {
        guard let userInput = userInput else {
            return
        }

//        view?.showLoading()
        interactor.updateProfile(input: userInput)
    }

    func saveUserPassword() {
        let passInput = userPasswordInput

        if passInput.newPassword.isEmpty
            || passInput.newPasswordConfirmation.isEmpty {


        } else if passInput.newPassword != passInput.newPasswordConfirmation {

        } else {

            interactor.updatePassword(input: userPasswordInput)
        }
    }

    func onSuccessGetProfileInfo(response: UserInfoResponse) {
        userInput = response.data
        profileInfoData = profileDataToArray(response)
        passwordData = [
            .init(inputField: .password, value: ""),
            .init(inputField: .confirmPassword, value: "")
        ]
        showAlert(title: "SUCCESS", message: response.message)
    }


    func onSuccessUpdateProfileInfo(response: UserInfoResponse) {
        showAlert(title: "SUCCESS", message: response.message)
    }

    func onSuccessUpdatePassword(response: PasswordResponse) {
        showAlert(title: "SUCCESS", message: response.message)
    }

    func onServiceError(error: APIErrorType) {
        showAlert(title: "ERROR", message: error.localizedDescription)
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

    // MARK: - Private functions
    private func profileDataToArray(_ response: UserInfoResponse) -> [ProfileInfoModel] {
        [
            .init(inputField: .userName, value: response.data.userName),
            .init(inputField: .firstName, value: response.data.firstName),
            .init(inputField: .lastName, value: response.data.lastName)
        ]
    }

    private func showAlert(title: String, message: String) {

    }

}
