//
//  ProfileViewBuilder.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import UIKit

struct ProfileViewBuilder {

    static func build() -> UIViewController {
        let interactor = ProfileViewInteractor(apiManager: MockAPIManager())
        let presenter = ProfileViewPresenter(interactor: interactor)

        let view = ProfileViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
