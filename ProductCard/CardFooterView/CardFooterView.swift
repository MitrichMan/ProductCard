//
//  CardFooterView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI


struct CardFooterView: View {
    
    @Binding var units: Units
    @State var quantity = 1
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: .gray.opacity(0.1), radius: 8, y: -16)
            VStack {
                Picker("Test", selection: $units) {
                    ForEach(Units.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                
                HStack {
                    PricePerView()
                        .padding(.horizontal, 16)
                    

                    TotalPriceStepperView(quantity: $quantity)
                        .padding(.trailing, 16)

                }
            }
        }
    }
}

#Preview {
    CardFooterView(units: .constant(.kilo))
}




