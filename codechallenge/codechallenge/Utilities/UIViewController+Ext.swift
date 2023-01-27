//
// UIViewController+Ext.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import UIKit

fileprivate var loadingBackground: UIView?

extension UIViewController {

    func showLoader() {
        loadingBackground = UIView(frame: view.bounds)
        loadingBackground?.backgroundColor = .white
        loadingBackground?.alpha = 0.7

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingBackground?.center ?? CGPoint.zero
        activityIndicator.startAnimating()

        loadingBackground?.addSubview(activityIndicator)
        view?.addSubview(loadingBackground ?? UIView())
    }

    func removeLoader() {
        loadingBackground?.removeFromSuperview()
        loadingBackground = nil
    }

    func showAlert(title: String = "", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}
