//
//  Product.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

struct Product {
    let name: String
    let productImageLink: String
    let promotionDescription: String
    let countryOfManufacture: String
    let regionOfManufacture:String
    let discount: Int
    let description: String
    let price: Double
    let pricePer: Units
    let characteristics: Characteristics
}

struct Characteristics {
    let energyValue: String
    let fats: String
    let carbohydrates: String
    let proteins: String
    let category: String
    let species: String
    let type: String
    let nettoWeight: Double
    let volume: Double
    let brand: String
    let country: String
    let standart: String
    let storageLife: String
    let minimumStorageTemperature: String
    let maximumStorageTemperature: String
}

struct Rewiew: Hashable {
    let reviewerName: String
    let date: String
    let mark: Double
    let reviewText: String
}
                    
