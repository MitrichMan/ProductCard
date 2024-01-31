//
//  DataManager.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    let promotionDescription = "Цена по карте"
    
    let trailingNavBarItems = ["doc.plaintext", "tray.and.arrow.up", "heart"]
    
    private init() {}
}
