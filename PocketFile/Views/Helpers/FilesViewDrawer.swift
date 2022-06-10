//
//  FilesViewDrawer.swift
//  EightBall
//
//  Created by Ostap Tyvonovych on 31.01.2022.
//

import UIKit

class FilesViewDrawer {
    private let presenter: FilesPresenter
    private let router: FilesRouter

    private(set) var gasketContentView: UIView!
    private(set) var collectionView: UICollectionView!
    private(set) var tableView: UITableView!
    
    private let tableViewDataSourcer = FilesTableViewDataSourcer()
    private let tableViewDelegator = FilesTableViewDelegator()
    private let collectionViewDataSourcer = FilesCollectionViewDataSourcer()
    private let collectionViewFlowLayoutDelegator = FilesCollectionViewFlowLayoutDelegator()
    
    private(set) var isInitialized = false
    public weak var delegate: FilesViewDrawerDelegate?
    
    // MARK: Drawing entry point
    
    public func setupInterface() {
        if isInitialized {
            print("Warning: The drawer's \(#function) should be called once and only once! Otherwise, behavior is undefined: file \(#file), line \(#line)")
            return
        }
        
        setupHelpers()
        
        if let strongReferenceDelegate = self.delegate {
            initializeInterface()
            setupViewHierarchy(using: strongReferenceDelegate)
            constraintInterface(using: strongReferenceDelegate)
            
            isInitialized = true
        } else {
            fatalError("At the moment of calling \(#function) delegate should not be nil")
        }
    }
    
    // MARK: - Helpers configuration methods
    
    public func setParentDirectoryID(_ directoryID: UUID) {
        tableViewDataSourcer.parentDirectoryID = directoryID
        collectionViewDataSourcer.parentDirectoryID = directoryID
    }
    
    private func setupHelpers() {
        tableViewDataSourcer.presenter = presenter
        collectionViewDataSourcer.presenter = presenter
        
        tableViewDelegator.router = router
        collectionViewFlowLayoutDelegator.router = router
    }
    
    // MARK: - Initialize UI
    
    private func initializeInterface() {
        gasketContentView = makeGasketContentView()
        collectionView = makeCollectionView()
        tableView = makeTableView()
    }
    private func makeGasketContentView() -> UIView {
        let gasketContentView = UIView()
        gasketContentView.backgroundColor = .blue
        
        return gasketContentView
    }
    private func makeCollectionView() -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .brown
        collectionView.register(FileCollectionViewCell.self, forCellWithReuseIdentifier: .fileTileReuseIdentifier)
        collectionView.delegate = collectionViewFlowLayoutDelegator
        collectionView.dataSource = collectionViewDataSourcer
        
        return collectionView
    }
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(FileTableViewCell.self, forCellReuseIdentifier: .fileTableReuseIdentifier)
        tableView.delegate = tableViewDelegator
        tableView.dataSource = tableViewDataSourcer

        return tableView
    }
    
    // MARK: - Make up view hierarchy
    
    private func setupViewHierarchy(using delegate: FilesViewDrawerDelegate) {
        delegate.addSubviewToHostingView(gasketContentView)
        gasketContentView.addSubview(collectionView)
        gasketContentView.addSubview(tableView)
    }
    
    // MARK: - Setup constraints
    
    private func constraintInterface(using delegate: FilesViewDrawerDelegate) {
        constraintGasketContentView(gasketContentView, using: delegate)
        constraintCollectionView(collectionView)
        constraintTableView(tableView)
    }
    private func constraintGasketContentView(_ gasketContentView: UIView, using delegate: FilesViewDrawerDelegate) {
        gasketContentView.translatesAutoresizingMaskIntoConstraints = false
        
        gasketContentView.topAnchor.constraint(equalTo: delegate.hostingViewSafeAreaLayoutGuide.topAnchor).isActive = true
        gasketContentView.bottomAnchor.constraint(equalTo: delegate.hostingViewSafeAreaLayoutGuide.bottomAnchor).isActive = true
        gasketContentView.leadingAnchor.constraint(equalTo: delegate.hostingViewSafeAreaLayoutGuide.leadingAnchor).isActive = true
        gasketContentView.trailingAnchor.constraint(equalTo: delegate.hostingViewSafeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    private func constraintCollectionView(_ collectionView: UIView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: gasketContentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: gasketContentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: gasketContentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: gasketContentView.trailingAnchor).isActive = true
    }
    private func constraintTableView(_ tableView: UIView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: gasketContentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: gasketContentView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: gasketContentView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: gasketContentView.trailingAnchor).isActive = true
    }
    
    // MARK: - Initializers
    
    init(presenter: FilesPresenter, router: FilesRouter) {
        self.presenter = presenter
        self.router = router
    }
}
