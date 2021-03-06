//
//  FilesModuleBuilder.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

struct FilesModuleBuilder {
    static func build(with directoryID: UUID) -> FilesViewController {
        let viewController = FilesViewController()
        let presenter = FilesPresenter(view: viewController, directoryID: directoryID)
        let router = FilesRouter(view: viewController)
        let viewDrawer = FilesViewDrawer(presenter: presenter, router: router)
        
        viewController.presenter = presenter
        viewController.viewDrawer = viewDrawer
        
        return viewController
    }
}
