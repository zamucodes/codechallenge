//
//  ProfileInteractor.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import Foundation
import Combine

class ProfileInteractor {

    weak var presenter: ProfilePresenter?
    private let apiManager: APIManagerProtocol

    init(apiManager: APIManagerProtocol) {
        self.apiManager = apiManager
    }

    func getProfile(for username: String) {
        apiManager.request(UserInfoRequest.getProfile(username: username)) { [weak self]
            (result: Result<UserInfoResponse, APIErrorType>) in
            switch result {
            case .failure(let error):
                self?.handleError(error)
            case .success(let profile):
                self?.presenter?.onSuccessGetProfileInfo(response: profile)
            }
        }
    }

    func updateProfile(input: ProfileData) {
        apiManager.request(UserInfoRequest.updateProfile(input: input)) { [weak self]
            (result: Result<UserInfoResponse, APIErrorType>) in
            switch result {
            case .failure(let error):
                self?.handleError(error)
            case .success(let profile):
                self?.presenter?.onSuccessUpdateProfileInfo(response: profile)
            }
        }
    }

    func updatePassword(input: PasswordData) {
        apiManager.request(PasswordEndpoint.updatePassword(input: input)) { [weak self]
            (result: Result<PasswordResponse, APIErrorType>) in
            switch result {
            case .failure(let error):
                self?.handleError(error)
            case .success(let password):
                self?.presenter?.onSuccessUpdatePassword(response: password)
            }
        }
    }

    private func handleError(_ error: APIErrorType) {
        presenter?.onServiceError(error: error)
    }
}
