//
//  ReusableInfoTable.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import SwiftUI

struct ReusableInfoTable: View {
    var listTitle: String
    var fields: [ProfileInfoModel] = []

    @State private var name: String = ""

    var body: some View {
        List {
            Section(header: Text(listTitle)) {
                ForEach(0..<fields.count, id: \.self) { item in
                    HStack {
                        Group {
                            Text(fields[item].inputField.rawValue)
                            Spacer(minLength: 20)
                            TextField("", text: $name)
                        }
                    }
                }
            }
        }

        HStack() {
            Spacer()
            Button {
                print("handle save action")
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
        .padding(.top, 20)
    }
}

struct ReusableInfoTable_Previews: PreviewProvider {
    static var previews: some View {
        ReusableInfoTable(listTitle: "BASIC INFORMATION",
                          fields: [
                            .init(inputField: .userName, value: "Test"),
                            .init(inputField: .firstName, value: "Test"),
                            .init(inputField: .lastName, value: "Test")
                          ])
    }
}
