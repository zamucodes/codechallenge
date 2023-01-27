//
//  ProfileView.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var presenter: ProfilePresenter

    private let backgroundColor : Color = Color(red: 123/255,
                                                green: 17/255,
                                                blue: 24/255)

    var body: some View {
        LoadingView(isShowing: $presenter.isLoading) {
            VStack {
                ReusableInfoList(listTitle: "BASIC INFORMATION",
                                 fields: presenter.profileInfoData,
                                 isSecureText: false) {
                    presenter.saveUserInfo()
                } valueChanged: { inputField, value in
                    presenter.changeUserInfo(data: inputField, value: value)
                }

                ReusableInfoList(listTitle: "PASSWORD",
                                 fields: presenter.passwordData,
                                 isSecureText: true) {
                    presenter.saveUserPassword()
                } valueChanged: { inputField, value in
                    presenter.changeUserPassword(data: inputField, value: value)
                }
            }
        }
        .onAppear {
            presenter.getUserInfo(for: "mine")
        }
        .alert(item: $presenter.alertView) { alert in
            Alert(title: Text(alert.title),
                  message: Text(alert.message),
                  dismissButton: .cancel())
        }
        .padding(.top, 20)
        .navigationBarTitle("User Profile", displayMode: .large)
        .background(backgroundColor)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let apiManager = MockAPIManager()
        let interactor = ProfileInteractor(apiManager: apiManager)
        let presenter = ProfilePresenter(interactor: interactor)
        ProfileView(presenter: presenter)
    }
}
