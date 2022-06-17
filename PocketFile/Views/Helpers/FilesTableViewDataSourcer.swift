//
//  FilesTableViewDataSourcer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesTableViewDataSourcer: NSObject, UITableViewDataSource {
    var presenter: FilesPresenter!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .fileTableReuseIdentifier, for: indexPath) as! FileTableViewCell
        cell.fileName = presenter.files[indexPath.row].name
        cell.fileType = presenter.files[indexPath.row].type
        cell.itemUUID = presenter.files[indexPath.row].uuid
        
        return cell
    }
}
