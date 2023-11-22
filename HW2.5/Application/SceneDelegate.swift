//
//  SceneDelegate.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = TableViewController()
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

