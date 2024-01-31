//
//  ProductCardView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    @StateObject private var viewModel = ProductCardViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                        .padding(.bottom, 8)
                    
                    ZStack {
                        ProductImageView(image: viewModel.productImage, isFetched: viewModel.imageIsFetched)
                        
                        PromotionTileView()
                    }
                    
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
                            Text(viewModel.discount)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                }
                
                .onAppear(perform: {
                    viewModel.fetchImages(from: API.productImage.rawValue)
                })
                
// MARK: - NavBar setup
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: { }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.green)
                        .font(.system(size: 20, weight: .medium))
                }))
                .navigationBarItems(
                    trailing: HStack {
                        TrailingNavigationBarItemsView()
                    }
                )
            }
        }
    }
}

#Preview {
    ProductCardView()
}
