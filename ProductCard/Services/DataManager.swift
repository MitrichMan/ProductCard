//
//  DataManager.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    let trailingNavBarItems = ["doc.plaintext", "tray.and.arrow.up", "heart"]
    
    let promotionDescription = "Цена по карте"
    
    let countryOfManufacture = "Россия"
    let regionOfManufacture = "Владимирская область"
    
    let discount = -5
    
    private init() {}
}
