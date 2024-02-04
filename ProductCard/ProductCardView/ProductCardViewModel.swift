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

final class ProductCardViewModel: ObservableObject {  @Published var product = DataManager.shared.getProduct()
    @Published var productImage = UIImage() {
        didSet {
            if !imageIsFetched {
                imageIsFetched.toggle()
            }
        }
    }
    
    @Published var flag = UIImage()
    
    var numberOfReviews = 0
    let reviews = DataManager.shared.makeRewiews()
    let selectedTab: TabName = .main
    var averageMark: Double = 0
    
    var imageIsFetched = false
    var discountIsAvailible = true
        
    @MainActor func prepareData() {
            fetchImages(from: product.productImageLink)
            checkAvailibility(of: product.discount)
            getFlag(of: product.countryOfManufacture)
            getAverageMark(for: reviews)
    }
    
    private func fetchImages(from url: String) {
        Task {
            guard let image = await fetchImage(from: url) else { return }
            productImage = image
        }
    }
    
    private func checkAvailibility(of discount: Double) {
        if product.discount == 0 {
            discountIsAvailible = false
        }
    }
    
    private func getFlag(of country: String) {
        if country == "Россия" {
            flag = UIImage(resource: .russianFlag)
        }
    }
    
    private func getPictureName(for tabName: TabName) -> String {
        if tabName == selectedTab {
            return "green"
        } else {
            return "black"
        }
    }
    
    private func getAverageMark(for reviews: [Review]) {
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
