//
//  Constants.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 17.06.2022.
//

import Foundation

// MARK: - FilesViewController
extension String {
    static let fileTileReuseIdentifier: String = "FileCollectionViewCell"
    static let fileTableReuseIdentifier: String = "FileTableViewCell"
}

// MARK: - CloudRepository
extension Notification.Name {
    static let cloudRepositoryUIShouldReloadDataNotification = Notification.Name(rawValue: "cloudRepositoryUIShouldReloadDataNotification")
}
