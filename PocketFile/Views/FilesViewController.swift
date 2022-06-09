//
//  FilesViewController.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 07.06.2022.
//

import UIKit

enum FileTreeViewType {
    case tiles
    case table
    
    var systemImageName: String {
        let result: String
        
        switch self {
        case .tiles:
            result = "square.grid.2x2"
        case .table:
            result = "list.dash"
        }
        
        return result
    }
}

class FilesViewController: UIViewController, FilesViewDrawerDelegate, FilesViewProtocol {
    private var parentDirectoryID: UUID!
    
    var presenter: FilesPresenter!
    var viewDrawer: FilesViewDrawer!
    
    var fileTreeViewType: FileTreeViewType = .tiles {
        didSet {
            updateBarButtonItems(using: fileTreeViewType)
            updateFileTreeView(using: fileTreeViewType)
        }
    }
    
    // MARK: - Pass parent directory ID
    
    /// Pass the directory ID when instantiating new files view controller in order to obtain relevant branch of the file tree.
    ///
    /// This method should be called once, before adding the view controller to the view controllers stack.
    ///
    /// - Parameter directoryID: Parent directory UUID structure. Zero UUID (00000000-0000-0000-0000-000000000000) is the special value representing root directory.
    public func setParentDirectoryID(_ directoryID: UUID) {
        if self.parentDirectoryID == nil {
            self.parentDirectoryID = directoryID
        }
    }

    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewDrawer.delegate = self
        viewDrawer.setupInterface()
        
        view.backgroundColor = .yellow
        updateBarButtonItems(using: fileTreeViewType)
        updateFileTreeView(using: fileTreeViewType)
    }
    
    // MARK: - View drawer delegate methods
    
    var hostingViewSafeAreaLayoutGuide: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    func addSubviewToHostingView(_ subview: UIView) {
        self.view.addSubview(subview)
    }
    
    // MARK: - Responding to internal UI state changes
    
    private func updateBarButtonItems(using fileTreeViewType: FileTreeViewType) {
        let viewIcon = makeViewIcon(using: fileTreeViewType)
        
        navigationItem.rightBarButtonItems = [viewIcon]
    }
    
    private func updateFileTreeView(using fileTreeViewType: FileTreeViewType) {
        switch fileTreeViewType {
        case .tiles:
            viewDrawer.collectionView.isHidden = false
            viewDrawer.tableView.isHidden = true
        case .table:
            viewDrawer.collectionView.isHidden = true
            viewDrawer.tableView.isHidden = false
        }
    }
    
    // MARK: - Creating navigation bar buttons
    
    private func makeViewIcon(using fileTreeViewType: FileTreeViewType) -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(systemName: fileTreeViewType.systemImageName),
                               style: .plain,
                               target: self,
                               action: #selector(viewIconTapped))
    }
    
    // MARK: - Responding to navigation bar buttons taps
    
    @objc private func viewIconTapped() {
        switch fileTreeViewType {
        case .tiles:
            fileTreeViewType = .table
            
        case .table:
            fileTreeViewType = .tiles
        }
    }
}

// MARK: - Constants

extension String {
    static let fileTileReuseIdentifier: String = "FileCollectionViewCell"
    static let fileTableReuseIdentifier: String = "FileTableViewCell"
}
