//
//  FileType.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

enum FileType: String, Decodable {
    case file = "f"
    case directory = "d"
}
