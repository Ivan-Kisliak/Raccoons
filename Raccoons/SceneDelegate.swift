//
//  SceneDelegate.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let marTableViewController = MarTableViewController()
        marTableViewController.raccoonDataManager = buildRaccoonManager()
        
        let rootViewController = marTableViewController
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    func buildRaccoonManager() -> IRaccoonDataManageable {
        let raccoonManager = RaccoonManager()
        
        let raccoonsSorted = raccoonManager.getRaccoons().sorted()
        
        let raccoonDataManager = RaccoonDataManager(raccoons: raccoonsSorted)
        
        return raccoonDataManager
    }
}
