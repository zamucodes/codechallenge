//
//  SceneDelegate.swift
//  codechallenge
//
//  Created by Samuel Chavez on 26/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        setRootController()
    }

    private func setRootController() {
        let dashboard = DashboardViewController()
        let navigationController = UINavigationController()
        setUpNavigation(navigation: navigationController)
        navigationController.viewControllers = [dashboard]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    private func setUpNavigation(navigation: UINavigationController) {
        navigation.navigationBar.prefersLargeTitles = true

        let app = UINavigationBarAppearance()
        app.configureWithOpaqueBackground()

        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().standardAppearance = app
        UINavigationBar.appearance().scrollEdgeAppearance = app
    }
}

