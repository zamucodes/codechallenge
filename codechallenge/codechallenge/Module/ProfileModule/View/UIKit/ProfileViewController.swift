//
//  ProfileViewController.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userInfoTable: UITableView!
    @IBOutlet weak var userPasswordTable: UITableView!
    @IBOutlet weak var saveUserInfoBtn: UIButton!
    @IBOutlet weak var saveUserPasswordBtn: UIButton!

    var presenter: ProfileViewPresenterProtocol?

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init(presenter: ProfileViewPresenterProtocol) {
        super.init(nibName: String(describing: Self.self) ,
                   bundle: Bundle(for: type(of: self)))
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTables()
        presenter?.getUserInfo(for: "mine")
    }

    @IBAction func onSaveUserInfo(_ sender: Any) {
        presenter?.saveUserInfo()
    }

    @IBAction func onSaveUserPassword(_ sender: Any) {
        presenter?.saveUserPassword()
    }

    private func setupUI() {
        title = "User Profile"
        configureBtnUI(saveUserInfoBtn)
        configureBtnUI(saveUserPasswordBtn)
    }

    private func setupTables() {
        registerCells(userInfoTable)
        registerCells(userPasswordTable)
    }

    private func configureBtnUI(_ button: UIButton) {
        button.tintColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
}

extension ProfileViewController: ProfileViewProtocol {
    func reloadInfo() {
        userInfoTable.reloadData()
        userPasswordTable.reloadData()
    }

    func showAlert(_ title: String, message: String) {
        showAlert(title: title, message: message)
    }

    func showLoading() {
        showLoader()
    }

    func hideLoading() {
        removeLoader()
    }
}
