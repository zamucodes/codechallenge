//
//  ReusableInfoList.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import SwiftUI

struct ReusableInfoList: View {
    var listTitle: String
    var fields: [ProfileInfoModel] = []
    var isSecureText: Bool
    var saveAction: () -> Void
    var valueChanged: (ProfileInfoModel, String) -> Void

    var body: some View {
        List {
            Section(header: Text(listTitle)) {
                ForEach(0..<fields.count, id: \.self) { item in
                    ReusableInputCell(fieldName: fields[item],
                                      isSecureText: isSecureText,
                                      fieldValue: fields[item].value,
                                      valueChanged: valueChanged)
                }
            }
        }

        HStack() {
            Spacer()
            Button {
                saveAction()
            } label: {
                HStack(spacing: 8) {
                    Text("SAVE CHANGES")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Rectangle().strokeBorder(.white, lineWidth: 1.25))
            }
            .accentColor(.white)
            Spacer()
        }
        .scrollContentBackground(.hidden)
        .background(.clear)
    }
}

struct ReusableInfoTable_Previews: PreviewProvider {
    static var previews: some View {
        ReusableInfoList(listTitle: "BASIC INFORMATION",
                         fields: [
                            .init(inputField: .userName, value: "Test"),
                            .init(inputField: .firstName, value: "Test"),
                            .init(inputField: .lastName, value: "Test")
                         ],
                         isSecureText: false,
                         saveAction: { },
                         valueChanged: { _, _ in }
        )
    }
}
