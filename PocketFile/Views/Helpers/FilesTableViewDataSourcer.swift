//
//  FilesTableViewDataSourcer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesTableViewDataSourcer: NSObject, UITableViewDataSource {
    var presenter: FilesPresenter!
    var parentDirectoryID: UUID!
    
    private var files: [String] {
        return presenter.contentsOfDirectory(forID: parentDirectoryID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .fileTableReuseIdentifier, for: indexPath) as! FileTableViewCell
        cell.fileName = files[indexPath.row]
        cell.fileType = .directory
        
        return cell
    }
}
