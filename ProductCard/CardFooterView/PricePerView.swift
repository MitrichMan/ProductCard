//
//  PricePerView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct PricePerView: View {
    let price: Double
    let totalPrice: String
    @Binding var pricePer: Units
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(totalPrice)")
                    .font(.system(size: 35, weight: .semibold))
                
                ZStack {
                    VStack(spacing: -5) {
                        HStack{
                            Text("₽")
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text(pricePer.rawValue)
                        }
                    }
                    .frame(width: 30, height: 30)
                    .font(.system(size: 14, weight: .semibold))
                    
                    Image(systemName: "line.diagonal")
                        .font(.system(size: 18, weight: .semibold))
                        .offset(CGSize(width: -5, height: -2))

                }
//                .frame(width: 30, height: 30)
            }
            Text("\(String(format: "%.1f", price))")
                .foregroundColor(.gray)
                .strikethrough()
        }
    }
}

#Preview {
    PricePerView(price: 399.9, totalPrice: "1234", pricePer: .constant(.kilo))
}
