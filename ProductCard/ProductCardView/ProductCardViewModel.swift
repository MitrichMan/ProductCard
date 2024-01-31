//
//  ProductCardViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation
import UIKit

final class ProductCardViewModel: ObservableObject {
    @Published var productImage: UIImage = UIImage() {
        didSet {
            if !imageIsFetched {
                imageIsFetched.toggle()
            }
        }
    }
    
    let discount = "\(DataManager.shared.discount)%"
    
    var imageIsFetched = false
    
    @MainActor func fetchImages(from url: String) {
        Task {
            guard let image = await fetchImage(from: url) else { return }
            productImage = image
        }
    }
    
    private func fetchImage(from url: String) async -> UIImage? {
        try? await UIImage(data: NetworkManager.shared.fetchImageData(from: url))
    }
}
