//
//  CardFooterViewModel.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

final class CardFooterViewModel: ObservableObject {
    
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
    
    func getToptalPrice(from price: Double, with discount: Double) -> String {
        String(NSString(format: "%.1f", (price - (price / 100 * discount))))
    }
}
