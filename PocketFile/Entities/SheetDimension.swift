//
//  SheetDimension.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 20.06.2022.
//

import Foundation

enum SheetDimension: String, Decodable {
    case rows = "ROWS"
    case columns = "COLUMNS"
    case unspecified = "DIMENSION_UNSPECIFIED"
}
