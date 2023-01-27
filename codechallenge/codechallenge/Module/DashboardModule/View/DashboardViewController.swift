//
//  DashboardViewController.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import UIKit
import SwiftUI

class DashboardViewController: UIViewController {

    @IBOutlet weak var showUIKit: UIButton!
    @IBOutlet weak var showSwiftUI: UIButton!

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
        configureBtnUI(showUIKit)
        configureBtnUI(showSwiftUI)
    }

    @IBAction func showUIKitVersion(_ sender: Any) {
        let profileVC = ProfileViewBuilder.build()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    @IBAction func showSwiftUIVersion(_ sender: Any) {
        let profileVC = ProfileBuilder.build()
        let hostingVC = UIHostingController(rootView: profileVC)
        navigationController?.pushViewController(hostingVC, animated: true)
    }

    private func configureBtnUI(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.link.cgColor
        button.layer.cornerRadius = button.bounds.width / 2
    }
}
