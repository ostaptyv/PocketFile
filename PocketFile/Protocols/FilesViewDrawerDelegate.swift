//
//  FilesViewDrawerDelegate.swift
//  EightBall
//
//  Created by Ostap Tyvonovych on 31.01.2022.
//

import UIKit

@objc protocol FilesViewDrawerDelegate: UITextFieldDelegate {
    var hostingViewSafeAreaLayoutGuide: UILayoutGuide { get }
    
    func addSubviewToHostingView(_ subview: UIView)
}
