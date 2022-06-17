//
//  FilesRouter.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation
import UIKit

class FilesRouter {
    private weak var view: FilesViewController?
    
    public func openDirectory(forID directoryID: UUID) {
        let filesVC = FilesModuleBuilder.build(with: directoryID)
        
        view?.navigationController?.pushViewController(filesVC, animated: true)
    }
    
    public init(view: FilesViewController) {
        self.view = view
    }
}
