//
//  FilesNetworkLayerDelegate.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

protocol FilesNetworkLayerDelegate: AnyObject {
    func networkRequestDidCompleteSuccessfully(with response: SheetEntity)
}
