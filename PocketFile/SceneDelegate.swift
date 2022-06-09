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
            let filesVC = FilesModuleBuilder.build()
            filesVC.setParentDirectoryID(.zero)
            
            window.rootViewController = UINavigationController(rootViewController: filesVC)
                window.makeKeyAndVisible()
            
            self.window = window
        }
    }
}
