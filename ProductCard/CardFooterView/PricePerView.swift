//
//  PricePerView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 03.02.2024.
//

import SwiftUI

struct PricePerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("379.9 ₽/кг")
                .font(.system(size: 25, weight: .semibold))
            Text("399,9")
                .foregroundColor(.gray)
                .strikethrough()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    PricePerView()
}
