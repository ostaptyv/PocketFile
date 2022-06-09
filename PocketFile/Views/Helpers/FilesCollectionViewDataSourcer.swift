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
        return presenter.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .fileTileReuseIdentifier , for: indexPath) as! FileCollectionViewCell
        cell.fileName = presenter.data[indexPath.item]
        cell.fileType = .file
        
        return cell
    }
}
