//
//  SheetEntity.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

struct SheetEntity: Decodable {
    let valueRanges: [SheetValueRangeEntity]
    
#if DEBUG
    let spreadsheetId: String // 1. We want to include this info in debug-packages to be able to debug if something goes wrong
#else
    enum CodingKeys: String, CodingKey { // 2. But we want network footprint to be as low as possible, so in release-packages we omit unneeded info
        case valueRanges
    }
#endif
}
