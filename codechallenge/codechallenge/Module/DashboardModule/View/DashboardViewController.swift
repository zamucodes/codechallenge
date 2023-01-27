//
//  DashboardViewController.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import UIKit
import SwiftUI

class DashboardViewController: UIViewController {

    let swiftUIController = UIHostingController(rootView: ProfileView())

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init() {
        super.init(nibName: String(describing: Self.self) ,
                   bundle: Bundle(for: type(of: self)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
    }

    @IBAction func showUIKitVersion(_ sender: Any) {
        let profileVC = ProfileViewBuilder.build()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    @IBAction func showSwiftUIVersion(_ sender: Any) {
        navigationController?.pushViewController(swiftUIController, animated: true)
    }
}
