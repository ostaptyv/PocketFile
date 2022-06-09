//
//  FilesTableViewDataSourcer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesTableViewDataSourcer: NSObject, UITableViewDataSource {
    var presenter: FilesPresenter!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .fileTableReuseIdentifier, for: indexPath) as! FileTableViewCell
        cell.fileName = presenter.data[indexPath.row]
        cell.fileType = .directory
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }
}
