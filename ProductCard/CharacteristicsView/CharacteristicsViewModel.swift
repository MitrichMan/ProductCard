//
//  CharacteristicsViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import Foundation

final class CharacteristicsViewModel: ObservableObject {
    
    @Published var product = Product(
        name: "",
        productImageLink: "",
        promotionDescription: "",
        countryOfManufacture: "",
        regionOfManufacture: "",
        discount: 0,
        description: "",
        characteristics: Characteristics(
            energyValue: "",
            fats: "",
            carbohydrates: "",
            proteins: "",
            category: "",
            species: "",
            type: "",
            nettoWeight: "",
            volume: "",
            brand: "",
            country: "",
            standart: "",
            storageLife: "",
            minimumStorageTemperature: "",
            maximumStorageTemperature: ""
        )
    )
    
    @Published var fieldsPresented = 4

    @Published var presentationModeButtonName = "Все характеристики"

    var isFullyPresented = false {
        didSet {
            fieldsPresented = isFullyPresented
            ? DataManager.shared.characteristicsFieldNames.count
            : 4
            presentationModeButtonName = isFullyPresented
            ? "Показать меньше"
            : "Все характеристики"
        }
    }
    
    let dottedSeparator = "........................................................................................................................................."
    
    func getCharacteristicsText(for fieldName: CharacteristicsFieldName) -> String {
        let characteristics = product.characteristics
        
        switch fieldName {
        case .manufactured:
            return "\(product.countryOfManufacture), \(product.regionOfManufacture)"
        case .energyValue:
            return characteristics.energyValue
        case .fats:
            return characteristics.fats
        case .carbohydrates:
            return characteristics.carbohydrates
        case .proteins:
            return characteristics.proteins
        case .category:
            return characteristics.category
        case .species:
            return characteristics.species
        case .type:
            return characteristics.type
        case .nettoWeight:
            return characteristics.nettoWeight
        case .volume:
            return characteristics.volume
        case .brand:
            return characteristics.brand
        case .country:
            return characteristics.country
        case .standart:
            return characteristics.standart
        case .storageLife:
            return characteristics.storageLife
        case .minimumStorageTemperature:
            return characteristics.minimumStorageTemperature
        case .maximumStorageTemperature:
            return characteristics.maximumStorageTemperature
        }
    }
}
