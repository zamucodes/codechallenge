//
//  ProfileBuilder.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

struct ProfileBuilder {

    static func build() -> ProfileView {
        let apiManager = MockAPIManager()
        let interactor = ProfileInteractor(apiManager: apiManager)
        let presenter = ProfilePresenter(interactor: interactor)
        let profileVC = ProfileView(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = profileVC

        return profileVC
    }
}
