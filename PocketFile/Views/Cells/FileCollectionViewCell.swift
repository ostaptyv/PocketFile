//
//  FileCollectionViewCell.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 07.06.2022.
//

import UIKit

class FileCollectionViewCell: UICollectionViewCell {
    
    public var fileName: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    public var fileType: FileType? = nil {
        didSet {
            changeFileIcon(using: fileType)
        }
    }
    public var itemUUID: UUID!
    
    private var gasketContentView: UIView!
    private var imageView: UIImageView!
    private var label: UILabel!
    
    // MARK: Entry point

    private func setupCell() {
        setupInterface()
    }
    
    // MARK: - Setup interface
    
    private func setupInterface() {
        initializeInterface()
        setupViewHierarchy()
        constraintInterface()
        
//        contentView.backgroundColor = .red
//        contentView.layer.borderColor = UIColor.black.cgColor
//        contentView.layer.borderWidth = 2
    }
    
    // MARK: - Initalize UI
    
    private func initializeInterface() {
        gasketContentView = makeGasketContentView()
        imageView = makeImageView()
        label = makeLabel()
    }
    private func makeGasketContentView() -> UIView {
        let gasketContentView = UIView()
        
        return gasketContentView
    }
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingMiddle
        label.textAlignment = .center
        
        return label
    }
    
    // MARK: - Make up view hierarchy
    
    private func setupViewHierarchy() {
        contentView.addSubview(gasketContentView)
        gasketContentView.addSubview(imageView)
        gasketContentView.addSubview(label)
    }
    
    // MARK: - Setup constraints
    
    private func constraintInterface() {
        constraintGasketContentView(gasketContentView)
        constraintImageView(imageView)
        constraintLabel(label)
    }
    private func constraintGasketContentView(_ gasketContentView: UIView) {
        gasketContentView.translatesAutoresizingMaskIntoConstraints = false
        
        gasketContentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        gasketContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gasketContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        gasketContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    private func constraintImageView(_ imageView: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: gasketContentView.topAnchor, constant:  20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: gasketContentView.leadingAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: gasketContentView.centerXAnchor).isActive = true
    }
    private func constraintLabel(_ label: UIView) {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: gasketContentView.leadingAnchor, constant: 12).isActive = true
        label.centerXAnchor.constraint(equalTo: gasketContentView.centerXAnchor).isActive = true
    }
    
    // MARK: - Private methods
    
    private func changeFileIcon(using fileType: FileType?) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 40, weight: .light)
        let systemImageName = fileType?.systemImageName ?? ""
        let image = UIImage(systemName: systemImageName, withConfiguration: configuration)
        
        imageView.image = image
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
}
