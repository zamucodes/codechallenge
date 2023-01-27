//
//  ProfileView.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import SwiftUI

struct ProfileView: View {

    private let backgroundColor : Color = Color(red: 123/255, green: 17/255, blue: 24/255)

    var body: some View {
        VStack {
            ReusableInfoTable(listTitle: "BASIC INFORMATION",
                              fields: [
                                .init(inputField: .userName, value: "Test"),
                                .init(inputField: .firstName, value: "Test"),
                                .init(inputField: .lastName, value: "Test")
                              ]
            )

            ReusableInfoTable(listTitle: "PASSWORD",
                              fields: [
                                .init(inputField: .password, value: ""),
                                .init(inputField: .confirmPassword, value: "")
                              ]
            )
        }
        .padding(.top, 20)
        .navigationBarTitle("User Profile", displayMode: .large)
        .background(backgroundColor)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
