//
//  ReusableInputCell.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import SwiftUI

struct ReusableInputCell: View {
    var fieldName: ProfileInfoModel
    var isSecureText: Bool = false
    @State var fieldValue: String
    var valueChanged: (ProfileInfoModel, String) -> Void

    var body: some View {
        HStack {
            Group {
                Text(fieldName.inputField.rawValue)
                Spacer(minLength: 20)
                if isSecureText {
                    SecureField("", text: $fieldValue)
                        .onChange(of: fieldValue) { newValue in
                            valueChanged(fieldName, newValue)
                        }
                } else {
                    TextField("", text: $fieldValue)
                        .onChange(of: fieldValue) { newValue in
                            valueChanged(fieldName, newValue)
                        }
                }
            }
        }
    }
}

struct ReusableInputCell_Previews: PreviewProvider {
    static var previews: some View {
        ReusableInputCell(fieldName: .init(inputField: .userName, value: ""),
                          isSecureText: false,
                          fieldValue: "",
                          valueChanged: { _, _ in }
        )
    }
}
