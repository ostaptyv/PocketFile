//
//  SheetValueRangeEntity.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

// API Reference: https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets.values#resource-valuerange
struct SheetValueRangeEntity: Decodable {
    let values: [[String]]
    
#if DEBUG
    let range: String // 1. We want to include this info in debug-packages to be able to debug if something goes wrong
    let majorDimension: SheetDimension
#else
    enum CodingKeys: String, CodingKey { // 2. But we want network footprint to be as low as possible, so in release-packages we omit unneeded info
        case values
    }
#endif
}
