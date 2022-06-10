//
//  FilesCollectionViewDataSourcer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesCollectionViewDataSourcer: NSObject, UICollectionViewDataSource {
    var presenter: FilesPresenter!
    var parentDirectoryID: UUID!
    
    private var files: [String] {
        return presenter.contentsOfDirectory(forID: parentDirectoryID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return files.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .fileTileReuseIdentifier , for: indexPath) as! FileCollectionViewCell
        cell.fileName = files[indexPath.item]
        cell.fileType = .file
        
        return cell
    }
}
