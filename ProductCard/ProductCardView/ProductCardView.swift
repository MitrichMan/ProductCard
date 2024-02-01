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
                VStack(alignment: .leading) {
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
                    
                    Text(viewModel.product.name)
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                    CountryOfManufactureView(
                        flag: viewModel.flag,
                        countryOfManufacture: viewModel.manufacturedAt
                    )
                    
                    Text("Описание")
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                    Text(viewModel.product.description)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                }
                
                .onAppear(perform: {
                    viewModel.product = DataManager.shared.getProduct()
                    viewModel.fetchImages(from: viewModel.product.productImageLink)
                    viewModel.checkAvailibility(of: viewModel.product.discount)
                    viewModel.getFlag(of: viewModel.product.countryOfManufacture)
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

struct CountryOfManufactureView: View {
    let flag: UIImage
    let countryOfManufacture: String
    
    var body: some View {
        HStack {
            Image(uiImage: flag)
                .resizable()
                .frame(width: 20, height: 20)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
            
            Text(countryOfManufacture)
                .font(.system(size: 14))
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
