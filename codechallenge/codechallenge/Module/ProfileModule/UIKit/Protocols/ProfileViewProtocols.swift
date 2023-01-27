//
//  ProfileViewProtocols.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfileViewPresenterProtocol? { get set }
    func reloadInfo()
    func showLoading()
    func hideLoading()
    func showAlert(_ title: String, message: String)
}

protocol ProfileViewPresenterProtocol: AnyObject {
    var interactor: ProfileViewInteractorProtocol? { get }
    func getUserInfo(for username: String)
    func onSuccessGetProfileInfo(response: UserInfoResponse)

    // Save functions
    func saveUserInfo()
    func saveUserPassword()
    func onSuccessUpdateProfileInfo(response: UserInfoResponse)
    func onSuccessUpdatePassword(response: PasswordResponse)

    func onServiceError(error: APIErrorType)

    func getNumberOfProfileItems() -> Int
    func getProfileItem(_ idx: Int) -> ProfileInfoModel
    func getNumberOfPasswordItems() -> Int
    func getPasswordItem(_ idx: Int) -> ProfileInfoModel

    func changeUserInfo(data: ProfileInfoModel, value: String)
    func changeUserPassword(data: ProfileInfoModel, value: String)
}

protocol ProfileViewInteractorProtocol: AnyObject {
    var presenter: ProfileViewPresenterProtocol? { get set }
    func getProfile(for username: String)
    func updateProfile(input: ProfileData)
    func updatePassword(input: PasswordData)
}
