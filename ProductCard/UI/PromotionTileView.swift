//
//  PromotionTileView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct PromotionTileView: View {
    let promotionDescription: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(promotionDescription)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .cornerRadius(5)
                Spacer()
            }
            Spacer()
        }
    }
}


#Preview {
    PromotionTileView(promotionDescription: "123456")
}
