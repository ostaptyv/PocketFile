//
//  FilesCollectionViewDataSourcer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesCollectionViewDataSourcer: NSObject, UICollectionViewDataSource {
    var presenter: FilesPresenter!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.files.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .fileTileReuseIdentifier , for: indexPath) as! FileCollectionViewCell
        cell.fileName = presenter.files[indexPath.item].name
        cell.fileType = presenter.files[indexPath.item].type
        cell.itemUUID = presenter.files[indexPath.row].uuid
        
        return cell
    }
}
