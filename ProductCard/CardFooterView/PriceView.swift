//
//  PriceView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct PriceView: View {
    @Binding var units: Units
    @State var quantity = 1
    let price: Double
    let totalPrice: String
    
    var body: some View {
        VStack {
            Picker("Test", selection: $units) {
                ForEach(Units.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            
            
            HStack {
                PricePerView(price: price, totalPrice: totalPrice)
                    .padding(.horizontal, 8)
                
                
                TotalPriceStepperView(quantity: $quantity, price: price)
                    .padding(.horizontal, 8)
                
            }
        }
    }
}

#Preview {
    PriceView(units: .constant(.kilo), price: 399.9, totalPrice: "345.6")
}
