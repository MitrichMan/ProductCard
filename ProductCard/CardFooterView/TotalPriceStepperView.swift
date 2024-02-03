//
//  TotalPriceStepperView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct TotalPriceStepperView: View {
    @Binding var quantity: Int
    
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
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                })
                .padding(.horizontal,8)
                
                VStack {
                    Text("\(quantity)")
                    Text("120₽")
                }
                .foregroundColor(.white)
                
                Button(action: {
                    quantity += 1
                }, label: {
                    Text("+")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                })
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    TotalPriceStepperView(quantity: .constant(2))
}
