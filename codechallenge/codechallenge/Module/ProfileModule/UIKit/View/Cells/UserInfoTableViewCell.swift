//
//  UserInfoTableViewCell.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import UIKit

protocol InputTextCellDelegate: AnyObject {
    func tableViewCell(
        valueChangedIn textField: UITextField,
        data: ProfileInfoModel
    )
}

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var fieldNameLbl: UILabel!
    @IBOutlet weak var fieldInputTxt: UITextField!

    var data: ProfileInfoModel?

    weak var delegate: InputTextCellDelegate?
    static let reuseIdentifier = "UserInfoCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        fieldNameLbl.text = ""
        fieldInputTxt.text = ""
    }

    func configureCell(data: ProfileInfoModel) {
        self.data = data

        if data.inputField == .password || data.inputField == .confirmPassword {
            fieldInputTxt.isSecureTextEntry = true
        }
        
        fieldNameLbl.text = data.inputField.rawValue
        fieldInputTxt.text = data.value
    }

    @IBAction func valueChanged(_ sender: UITextField) {
        guard let data = data else {
            return
        }
        delegate?.tableViewCell(valueChangedIn: fieldInputTxt, data: data)
    }
}
