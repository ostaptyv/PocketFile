//
//  FileType+systemImageName.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

extension FileType {
    var systemImageName: String {
        let result: String
        switch self {
        case .file:
            result = "doc"
        case .directory:
            result = "folder"
        }
        
        return result
    }
}
