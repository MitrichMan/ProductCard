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
            GeometryReader { geometry in
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
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        DescriptionView(description: viewModel.product.description)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        
                        VStack(alignment: .leading) {
                            Text("Основные характеристики")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.vertical, 8)
                            
                            ForEach(0..<viewModel.numberOfPresentedFields, id: \.self) { index in
                                HStack(alignment: .top, spacing: 0) {
                                    Text(DataManager.shared.characteristicsFieldNames[index].rawValue)
                                        .frame(maxHeight: 60, alignment: .top)
                                        .multilineTextAlignment(.leading)
                                        .layoutPriority(1)
                                    
                                    Text(".........................................................................................................................................")
                                        .frame(maxHeight: 20)
                                        .layoutPriority(0)
                                    
                                    Text(viewModel.getCharacteristicsText(for: DataManager.shared.characteristicsFieldNames[index]))
                                        .frame(maxHeight: 60, alignment: .top)
                                        .multilineTextAlignment(.trailing)
                                        .layoutPriority(1)
                                }
                            }
                            .animation(.default)
                            
                            Button(action: {
                                viewModel.characteristicsModuleIsFullyPresented.toggle()
                            }, label: {
                                Text("Все Характеристики")
                                    .foregroundColor(.green)
                            })
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
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
    }
}

struct DescriptionView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Описание")
                .font(.system(size: 18, weight: .semibold))
                .padding(.bottom)
            
            Text(description)
        }
    }
}
