//
//  ProductCardViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation
import UIKit
import Combine

final class ProductCardViewModel: ObservableObject {
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
    ) {
        didSet {
            manufacturedAt = "\(product.countryOfManufacture),  \(product.regionOfManufacture)"
            discountLabelText = "-\(product.discount)%"
        }
    }
    
    @Published var productImage = UIImage() {
        didSet {
            if !imageIsFetched {
                imageIsFetched.toggle()
            }
        }
    }
    
    let rewiews = DataManager.shared.reviews
    
    var imageIsFetched = false
    var discountIsAvailible = true
    
    var discountLabelText = ""
    var manufacturedAt = ""
    
    var characteristicsModuleIsFullyPresented = false {
        didSet {
            numberOfPresentedFields = characteristicsModuleIsFullyPresented
            ? DataManager.shared.characteristicsFieldNames.count
            : 4
        }
    }
    
    @Published var numberOfPresentedFields: Int = 4
    
    @Published var flag = UIImage()
    
    @MainActor func fetchImages(from url: String) {
        Task {
            guard let image = await fetchImage(from: url) else { return }
            productImage = image
        }
    }
    
    func checkAvailibility(of discount: Int) {
        if product.discount == 0 {
            discountIsAvailible = false
        }
    }
    
    func getFlag(of country: String) {
        if country == "Россия" {
            flag = UIImage(resource: .russianFlag)
        }
    }
    
    func getCharacteristicsText(for fieldName: CharacteristicsFieldNames) -> String {
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
    
    private func fetchImage(from url: String) async -> UIImage? {
        try? await UIImage(data: NetworkManager.shared.fetchImageData(from: url))
    }
}
