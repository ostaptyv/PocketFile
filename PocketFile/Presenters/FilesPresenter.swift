//
//  FilesPresenter.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

class FilesPresenter {
    private weak var view: FilesViewProtocol?
    
    let data = Array(repeating: ["вступление.docx", "presentation.ppt", "75595287_586790498778990_5946898716899147776_n", "diplom.pdf", "sources", "approximation.py", "Photos"], count: 5).flatMap { $0 }
    
    public init(view: FilesViewProtocol) {
        self.view = view
    }
}
