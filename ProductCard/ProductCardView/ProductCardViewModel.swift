//
//  ProductCardViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation
import UIKit
import Combine
import SwiftUI

final class ProductCardViewModel: ObservableObject {
    @Published var product = Product(
        name: "",
        productImageLink: "",
        promotionDescription: "",
        countryOfManufacture: "",
        regionOfManufacture: "", 
//        mark: 0,
        discount: 0,
        description: "",
        price: 0,
        pricePer: .unit,
        characteristics: Characteristics(
            energyValue: "",
            fats: "",
            carbohydrates: "",
            proteins: "",
            category: "",
            species: "",
            type: "",
            nettoWeight: 0,
            volume: 0,
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
            discountLabelText = "-\(String(format: "%.0f", product.discount))%"
        }
    }
    
    @Published var productImage = UIImage() {
        didSet {
            if !imageIsFetched {
                imageIsFetched.toggle()
            }
        }
    }
    
    @Published var flag = UIImage()
    
    let reviews = DataManager.shared.makeRewiews()
    let selectedTab: TabName = .main
    var averageMark: Double = 0
    
    var imageIsFetched = false
    var discountIsAvailible = true
    
    var discountLabelText = ""
    var manufacturedAt = ""
    @Published var numberOfReviews = 0 {
        didSet {
            print(numberOfReviews)
        }
    }
    
    @MainActor func fetchImages(from url: String) {
        Task {
            guard let image = await fetchImage(from: url) else { return }
            productImage = image
        }
    }
    
    func checkAvailibility(of discount: Double) {
        if product.discount == 0 {
            discountIsAvailible = false
        }
    }
    
    func getFlag(of country: String) {
        if country == "Россия" {
            flag = UIImage(resource: .russianFlag)
        }
    }
    
    func getPictureName(for tabName: TabName) -> String {
        if tabName == selectedTab {
            return "green"
        } else {
            return "black"
        }
    }
    
    func getAverageMark(for reviews: [Review]) {
        var count = 0.0
        var sum = 0.0
        var average = 0.0
        for review in reviews {
            sum += review.mark
            count += 1
            average = sum / count
        }
        averageMark = average
    }
    
    private func fetchImage(from url: String) async -> UIImage? {
        try? await UIImage(data: NetworkManager.shared.fetchImageData(from: url))
    }
}
