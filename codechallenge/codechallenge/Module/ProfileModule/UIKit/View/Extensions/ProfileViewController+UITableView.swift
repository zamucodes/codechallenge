//
//  ProfileViewController+UITableView.swift
//  codechallenge
//
//  Created by Samuel Chavez on 27/01/23.
//

import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func registerCells(_ tableView: UITableView) {
        tableView.sectionHeaderTopPadding = 0
        let nib = UINib(nibName: String(describing: UserInfoTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserInfoTableViewCell.reuseIdentifier)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .systemGray6
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView == userInfoTable ? "BASIC INFORMATION" : "PASSWORD"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == userInfoTable {
            return presenter?.getNumberOfProfileItems() ?? 0
        }

        if tableView == userPasswordTable {
            return presenter?.getNumberOfPasswordItems() ?? 0
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.reuseIdentifier,
                                                    for: indexPath) as? UserInfoTableViewCell {

            cell.delegate = self
            cell.selectionStyle = .none

            if tableView == userInfoTable {
                guard let profileRow = presenter?.getProfileItem(indexPath.row) else { return cell }
                cell.configureCell(data: profileRow)
                return cell
            }

            if tableView == userPasswordTable {
                guard let passwordRow = presenter?.getPasswordItem(indexPath.row) else { return cell }
                cell.configureCell(data: passwordRow)
                return cell
            }
        }
        return UITableViewCell()
    }
}
