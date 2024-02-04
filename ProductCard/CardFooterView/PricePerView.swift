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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(totalPrice) ₽/кг")
                    
                    .font(.system(size: 25, weight: .semibold))
//                ZStack {
//                    VStack {
//                        HStack(alignment: .bottom) {
//                            Text("₽")
//                            Spacer()
//                        }
//                        HStack(alignment: .top) {
//                            Spacer()
//                            Text("кг")
//                        }
//                    }
//                    Text("/")
//                }
//                .font(.system(size: 16, weight: .semibold))
//                .frame(width: 30, height: 30)
            }
            Text("\(String(format: "%.1f", price))")
                .foregroundColor(.gray)
                .strikethrough()
        }
    }
}

#Preview {
    PricePerView(price: 399.9, totalPrice: "1234")
}
