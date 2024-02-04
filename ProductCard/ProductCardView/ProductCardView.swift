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
            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        Divider()
                        
                        ZStack {
                            ProductImageView(
                                image: viewModel.productImage,
                                isFetched: viewModel.imageIsFetched
                            )
                            
                            PromotionTileView(
                                promotionDescription: viewModel.product.promotionDescription
                            )
                        }
                        .padding(.horizontal)
                        
                        MarksAndDiscountView(
                            discount: viewModel.product.discount,
                            discountIsAvailible: viewModel.discountIsAvailible,
                            mark: viewModel.averageMark, 
                            numberOfReviews: viewModel.reviews.count
                        )
                        .padding(.horizontal)
                        
                        HStack {
                            Text(viewModel.product.name)
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                        CountryOfManufactureView(
                            flag: viewModel.flag,
                            countryOfManufacture: "\(viewModel.product.countryOfManufacture),  \(viewModel.product.regionOfManufacture)"
                        )
                        .padding(.horizontal)
                        
                        DescriptionView(description: viewModel.product.description)
                            .padding(.horizontal, 16)
                        
                        CharacteristicsView()
                            .animation(.default)
                            .padding(.horizontal, 16)
                        
                        ReviewsView(
                            reviews: viewModel.reviews
                        )
                            .padding(.bottom, 16)
                    }
                }
                
                
                .onAppear(perform: {
                    viewModel.prepareData()
                })
               
                
                
                CardFooterView(
                    units: $viewModel.product.pricePer, 
                    price: viewModel.product.price,
                    discount: viewModel.product.discount,
                    selectedTab: viewModel.selectedTab
                )
                    .frame(height: 180)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: { }, label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.green)
                    .font(.system(size: 18, weight: .medium))
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
