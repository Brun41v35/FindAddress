//
//  SceneDelegate.swift
//  FindAddress
//
//  Created by Bruno Silva on 02/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    //MARK: - Variables
    var window: UIWindow?

    //MARK: - Functions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupInformationScreen()
        window?.makeKeyAndVisible()
    }
    
    private func setupInformationScreen() -> UINavigationController {
        let informationViewController = InformationAddressViewController()
        informationViewController.title = "Olá"
        return UINavigationController(rootViewController: informationViewController)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

