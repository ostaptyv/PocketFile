//
//  File.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

struct File: Decodable {
    let name: String
    let type: FileType
    let uuid: UUID
    let parentUUID: UUID?
}
