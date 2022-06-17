//
//  CloudRepository.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 10.06.2022.
//

import Foundation

class CloudRepository: FilesNetworkLayerDelegate {
    private var networkLayer: FilesNetworkLayer!
    private var fileTree = [FileEntity]()
    
    // MARK: - Public interface
    
    public static let shared = CloudRepository()
    
    public func contentsOfDirectory(forID directoryID: UUID) -> [FileEntity] {
        var result = [FileEntity]()
        
        for item in fileTree {
            if item.parentUUID == directoryID {
                result.append(item)
            }
        }
        
        return result
    }
    
    public func directoryName(forID directoryID: UUID) -> String {
        if directoryID == .zero {
            return "Root"
        }
        
        let directoryItem = fileTree.first { file in
            return file.uuid == directoryID
        }
        
        if let directoryItem = directoryItem {
            return directoryItem.name
        } else {
            return ""
        }
    }
    
    // MARK: - Entry point
    
    private func setupRepository() {
        networkLayer = FilesNetworkLayer(delegate: self)
        networkLayer.loadFileData()
    }
    
    // MARK: - Files network layer delegate methods
    
    func networkRequestDidCompleteSuccessfully(with response: SheetEntity) {
        fileTree = transformSheetToFiles(response)
        
        NotificationCenter.default.post(name: .cloudRepositoryUIShouldReloadDataNotification, object: nil)
    }
    
    // MARK: - Private methods
    
    private func transformSheetToFiles(_ sheetEntity: SheetEntity) -> [FileEntity] {
        let valueRange = sheetEntity.valueRanges.first!
        
        return valueRange.values.map(transformValueRangeToFile(_:))
    }
    
    private func transformValueRangeToFile(_ valueRange: [String]) -> FileEntity {
        let name = valueRange[3]
        let type = FileType(rawValue: valueRange[2])!
        let uuid = UUID(uuidString: valueRange[0])!
        let parentUUID = valueRange[1].isEmpty ? UUID.zero : UUID(uuidString: valueRange[1])!
        
        return FileEntity(name: name,
                          type: type,
                          uuid: uuid,
                          parentUUID: parentUUID)
    }
    
    // MARK: - Initializers
    
    private init() {
        setupRepository()
    }
}
