//
//  FilesPresenter.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

class FilesPresenter {
    private weak var view: FilesViewProtocol?
    
    let currentDirectoryID: UUID
    private var cachedFiles: [FileEntity]?
    private var cachedDirectoryName: String?
    
    // MARK: - Public interface
    
    public var files: [FileEntity] {
        if let cachedFiles = cachedFiles {
            return cachedFiles
        }
        
        cachedFiles = CloudRepository.shared.contentsOfDirectory(forID: self.currentDirectoryID)
        return cachedFiles!
    }
    
    public var directoryName: String {
        if let cachedDirectoryName = cachedDirectoryName {
            return cachedDirectoryName
        }
        
        cachedDirectoryName = CloudRepository.shared.directoryName(forID: currentDirectoryID)
        return cachedDirectoryName!
    }
    
    // MARK: - Cloud repository delegate conformance

    @objc func shouldReloadData() {
        cachedFiles = nil // presenter should create a new cache if the data in the model changes
        
        DispatchQueue.main.async {
            self.view?.shouldReloadData()
        }
    }
    
    // MARK: - Initializers
    
    /// Creates new instance of the presenter.
    ///
    /// Should not be used directly in the code unless testing, consider using `FilesModuleBuilder.build(with:)`.
    ///
    /// - Parameters:
    ///   - view: View controller that will communicate with the model layer via this presenter.
    ///   - directoryID: Current directory identifier. If you pass ID of some directory, its files and child directories will be retrieved by the presenter. If you want to reference the root directory use a zero UUID (00000000-0000-0000-0000-000000000000).
    public init(view: FilesViewProtocol, directoryID currentDirectoryID: UUID) {
        self.view = view
        self.currentDirectoryID = currentDirectoryID
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shouldReloadData),
                                               name: .cloudRepositoryUIShouldReloadDataNotification,
                                               object: nil)
    }
}
