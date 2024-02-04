//
//  MarksAndDiscountView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct MarksAndDiscountView: View {
    let discount: String
    let discountIsAvailible: Bool
    let mark: Double
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("\(String(format: "%.1f", mark))")
                .font(.system(size: 16, weight: .semibold))
            
            Text("| \(DataManager.shared.numberOfReviews) отзывов")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Spacer()
            if discountIsAvailible {
                ZStack {
//                    Color.red
                    DiscountFlagView()
                        .frame(width: 30, height: 20)
                        .offset(y: -5)
                    Text(discount)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    MarksAndDiscountView(
        discount: "-5%",
        discountIsAvailible: true,
        mark: 4.7
    )
}
