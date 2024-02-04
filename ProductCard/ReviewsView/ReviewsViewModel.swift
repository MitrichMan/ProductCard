//
//  ReviewsViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import Foundation

final class ReviewsViewModel: ObservableObject {
    @Published var numberOfReviews = 0
    
    func getNumber(of reviews: [Review]) {
        numberOfReviews = reviews.count
    }
}
