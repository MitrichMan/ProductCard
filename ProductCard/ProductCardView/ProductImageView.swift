//
//  ProductImageView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct ProductImageView: View {
    let image: UIImage
    let isFetched: Bool
    
    var body: some View {
        if isFetched {
            Image(uiImage: image)
                .resizable()
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
        } else {
            ZStack{
                Color.gray
                    .cornerRadius(20)
                    .opacity(0.15)
                    .aspectRatio(contentMode: .fit)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}
