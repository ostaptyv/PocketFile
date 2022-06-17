//
//  FilesTableViewDelegator.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesTableViewDelegator: NSObject, UITableViewDelegate {
    var router: FilesRouter!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! FileTableViewCell
        
        if cell.fileType == .directory {
            router.openDirectory(forID: cell.itemUUID)
        }
    }
}
