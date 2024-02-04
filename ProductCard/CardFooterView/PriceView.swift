//
//  PriceView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct PriceView: View {
    @Binding var units: Units
    @Binding var quantity: Int
    let price: Double
    let priceForOne: String
    let totalPrice: String
    
    var body: some View {
        VStack {
            Picker("", selection: $units) {
                ForEach(Units.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            
            
            HStack {
                PricePerView(price: price, totalPrice: priceForOne, pricePer: $units)
                    .padding(.horizontal, 8)
                
                
                TotalPriceStepperView(quantity: $quantity, price: price, pricePer: units, totalPrice: totalPrice)
                    .padding(.horizontal, 8)
                
            }
        }
    }
}

#Preview {
    PriceView(units: .constant(.kilo), quantity: .constant(2), price: 399.9, priceForOne: "379", totalPrice: "345.6")
}
