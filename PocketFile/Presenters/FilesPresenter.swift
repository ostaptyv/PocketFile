//
//  FilesPresenter.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

class FilesPresenter: FilesNetworkLayerDelegate {
    private weak var view: FilesViewProtocol?
    var networkLayer: FilesNetworkLayer!
        
    // MARK: - Public interface
    
    public func contentsOfDirectory(forID directoryID: UUID) -> [String] {
        return Array(repeating: ["вступление.docx", "presentation.ppt", "75595287_586790498778990_5946898716899147776_n", "diplom.pdf", "sources", "approximation.py", "Photos"], count: 5).flatMap { $0 }
    }
    
    // MARK: - Files network layer delegate methods
    
    func networkRequestDidCompleteSuccessfully(with response: SheetEntity) {
        
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
        let parentUUID = valueRange[1].isEmpty ? UUID.zero : UUID(uuidString: valueRange[1])
        
        return FileEntity(name: name,
                          type: type,
                          uuid: uuid,
                          parentUUID: parentUUID)
    }
    
    // MARK: - Initializers
    
    public init(view: FilesViewProtocol) {
        self.view = view
    }
}
