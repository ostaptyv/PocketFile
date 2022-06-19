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
            result = "list.dash"
        case .table:
            result = "square.grid.2x2"
        }
        
        return result
    }
}

class FilesViewController: UIViewController, FilesViewDrawerDelegate, FilesViewProtocol {
    var presenter: FilesPresenter!
    var viewDrawer: FilesViewDrawer!
    
    private var fileTreeViewType: FileTreeViewType {
        get {
            let navigationViewController = castNavigationViewController()
            return navigationViewController.fileTreeViewType
        }
        set {
            let navigationViewController = castNavigationViewController()
            navigationViewController.fileTreeViewType = newValue
            updateFileTreeView(using: newValue)
            updateBarButtonItems(using: newValue)
        }
    }
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewDrawer.delegate = self
        viewDrawer.setupInterface()
        
        updateFileTreeView(using: fileTreeViewType)
        updateBarButtonItems(using: fileTreeViewType)
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = presenter.directoryName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateFileTreeView(using: fileTreeViewType)
        updateBarButtonItems(using: fileTreeViewType)
    }
    
    // MARK: - View drawer delegate conformance
    
    var hostingViewSafeAreaLayoutGuide: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    func addSubviewToHostingView(_ subview: UIView) {
        self.view.addSubview(subview)
    }
    
    // MARK: - View protocol (interface for presenter) methods
    
    func shouldReloadData() {
        viewDrawer.collectionView.reloadData()
        viewDrawer.tableView.reloadData()
    }
    
    // MARK: - Respond to state changes in file tree view (table/tiles)
    
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
    
    private func updateBarButtonItems(using fileTreeViewType: FileTreeViewType) {
        let viewIcon = makeViewIcon(using: fileTreeViewType)
        
        navigationItem.rightBarButtonItem = viewIcon
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
    
    // MARK: - Service methods
    
    private func castNavigationViewController() -> NavigationViewProtocol {
        guard let navigationController = navigationController else {
            fatalError("You should present FilesViewController as a child view of navigation controller")
        }
        
        if let navigationViewController = navigationController as? NavigationViewProtocol {
            return navigationViewController
        } else {
            fatalError("Parent navigation controller must conform to NavigationViewProtocol")
        }
    }
}
