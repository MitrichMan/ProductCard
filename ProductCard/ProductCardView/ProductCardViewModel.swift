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
        description: ""
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
    
    var discountLabelText = ""
    
    var imageIsFetched = false
    var discountIsAvailible = true
    
    var manufacturedAt = ""
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
    
    private func fetchImage(from url: String) async -> UIImage? {
        try? await UIImage(data: NetworkManager.shared.fetchImageData(from: url))
    }
}
