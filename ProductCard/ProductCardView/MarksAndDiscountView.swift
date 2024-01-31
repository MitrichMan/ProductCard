//
//  MarksAndDiscountView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct MarksAndDiscountView: View {
    let discount: String
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("4.7")
                .font(.system(size: 16, weight: .semibold))
            
            Text("| 19 отзывов")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Spacer()
            
            ZStack {
                Color.red
                    .frame(width: 30, height: 20)
                Text(discount)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
//        .padding(.horizontal)
//        .padding(.vertical, 6)
    }
}


#Preview {
    MarksAndDiscountView(discount: "10")
}
