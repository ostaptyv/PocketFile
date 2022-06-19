//
//  SceneDelegate.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 07.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationVC = NavigationViewModuleBuilder.build()
            let filesVC = FilesModuleBuilder.build(with: .zero)
            
            navigationVC.pushViewController(filesVC, animated: false)
            window.rootViewController = navigationVC
            window.makeKeyAndVisible()
            
            self.window = window
        }
    }
}
