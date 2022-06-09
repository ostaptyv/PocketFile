//
//  FileTableViewCell.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import UIKit

class FileTableViewCell: UITableViewCell {
    
    public var fileName: String? {
        get {
            return textLabel?.text
        }
        set {
            textLabel?.text = newValue
        }
    }
    public var fileType: FileType? = nil {
        didSet {
            configureCell(using: fileType)
        }
    }
    public var itemUUID: UUID!
    
    private func configureCell(using fileType: FileType?) {
        let systemImageName = fileType?.systemImageName ?? ""
        let hasArrow = fileType == .directory
        
        imageView?.image = UIImage(systemName: systemImageName)
        accessoryType = hasArrow ? .disclosureIndicator : .none
    }
}
