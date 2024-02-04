//
//  TotalPriceStepperView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct TotalPriceStepperView: View {
    @Binding var quantity: Int
    let price: Double
    var pricePer: Units
    var totalPrice: String
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.green)
            HStack {
                Button(action: {
                    if quantity > 0 {
                        quantity -= 1
                    }
                }, label: {
                    Text("-")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                })
                .padding(.horizontal,8)
                
                VStack(alignment: .leading) {
                    Text("\(quantity) \(pricePer.rawValue)")
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 50, alignment: .trailing)
                        
                    Text("\(String(format: "%.1f",(price - price / 100 * 5) * Double(quantity)))₽")
                        .font(.system(size: 16))
                        .frame(width: 65)

                }
                .frame(width: 65)
                .foregroundColor(.white)
                
                Button(action: {
                    quantity += 1
                }, label: {
                    Text("+")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                })
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, 16)
        }
        .frame(width: 180, height: 50)
    }
}

#Preview {
    TotalPriceStepperView(quantity: .constant(2), price: 399.9, pricePer: .unit, totalPrice: "23456")
}
