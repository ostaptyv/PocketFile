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
//        collectionView.deselectItem(at: indexPath, animated: true)
        let cell = collectionView.cellForItem(at: indexPath)
        
//        //Briefly fade the cell on selection
//            UIView.animate(withDuration: 0.2,
//                           animations: {
//                            //Fade-out
//                            cell?.alpha = 0.5
//            }) { (completed) in
//                UIView.animate(withDuration: 0.2,
//                               animations: {
//                                //Fade-out
//                                cell?.alpha = 1
//                })
//            }
    }
}
