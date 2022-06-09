//
//  UUID+zero.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

extension UUID {
    static var zero: UUID {
        let uuidZero: uuid_t = (0, 0, 0, 0,
                                0, 0, 0, 0,
                                0, 0, 0, 0,
                                0, 0, 0, 0)
        
        return UUID(uuid: uuidZero)
    }
}
