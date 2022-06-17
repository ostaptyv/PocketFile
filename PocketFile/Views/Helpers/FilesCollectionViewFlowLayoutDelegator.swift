//
//  FilesCollectionViewFlowLayoutDelegator.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FilesCollectionViewFlowLayoutDelegator: NSObject, UICollectionViewDelegateFlowLayout {
    var router: FilesRouter!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width

        return CGSize(width: screenWidth / 3, height: 121)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FileCollectionViewCell
        
        if cell.fileType == .directory {
            router.openDirectory(forID: cell.itemUUID)
        }
    }
}
