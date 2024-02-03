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
                        ProductImageView(
                            image: viewModel.productImage,
                            isFetched: viewModel.imageIsFetched
                        )
                        
                        PromotionTileView(
                            promotionDescription: viewModel.product.promotionDescription
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    
                    MarksAndDiscountView(
                        discount: viewModel.discountLabelText,
                        discountIsAvailible: viewModel.discountIsAvailible
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    
                    HStack {
                        Text(viewModel.product.name)
                            .font(.system(size: 30, weight: .semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        
                        Spacer()
                    }
                    
                    CountryOfManufactureView(
                        flag: viewModel.flag,
                        countryOfManufacture: viewModel.manufacturedAt
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    DescriptionView(description: viewModel.product.description)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                    CharacteristicsView()
                        .animation(.default)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                    ReviewsView(reviews: DataManager.shared.reviews)
                        .padding(.vertical, 8)
                    
                    CardFooterView()
                }
            }
            
            
            .onAppear(perform: {
                viewModel.product = DataManager.shared.getProduct()
                viewModel.fetchImages(from: viewModel.product.productImageLink)
                viewModel.checkAvailibility(of: viewModel.product.discount)
                viewModel.getFlag(of: viewModel.product.countryOfManufacture)
                DataManager.shared.makeRewiews()
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


#Preview {
    ProductCardView()
}
