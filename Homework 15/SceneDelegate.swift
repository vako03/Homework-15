//
//  SceneDelegate.swift
//  Homework 15
//
//  Created by vako on 10.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: FirstVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
}
