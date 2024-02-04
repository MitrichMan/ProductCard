//
//  CardFooterViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

final class CardFooterViewModel: ObservableObject {
    @Published var quantity = 1
    
    func getPictureName(for tabName: TabName) -> String {
        switch tabName {
        case .main:
            "house.circle"
        case .catalogue:
            "square.grid.2x2"
        case .cart:
            "cart"
        case .profile:
            "person"
        }
    }
    
    func getColourName(for selectedTab: TabName, currentIteration tab: TabName) -> Color {
        if selectedTab == tab {
            return .green
        } else {
            return .black
        }
    }
    
    func geStringTotalPrice(for quantity: Int, from price: Double, with discount: Double) -> String {
        String(format: "%.1f", getTotalPrice(for: quantity, from: price, with: discount))
    }
    
    private func getTotalPrice(for quantity: Int, from price: Double, with discount: Double) -> Double {
        (price - (price / 100 * discount)) * Double(quantity)
    }
}
