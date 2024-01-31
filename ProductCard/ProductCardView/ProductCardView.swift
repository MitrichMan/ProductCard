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
                        
                        if viewModel.imageIsFetched {
                            Image(uiImage: viewModel.productImage)
                                .resizable()
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        } else {
                            
                            ZStack{
                                Color.gray
                                    .cornerRadius(20)
                                    .opacity(0.15)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text(DataManager.shared.promotionDescription)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .cornerRadius(5)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(.horizontal,20)
                    }
                }
                
                .onAppear(perform: {
                    viewModel.fetchImages(from: API.productImage.rawValue)
                })
                
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: { }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.green)
                        .font(.system(size: 20, weight: .semibold))
                }))
                .navigationBarItems(
                    trailing: HStack {
                        ForEach(
                            DataManager.shared.trailingNavBarItems,
                            id: \.self
                        ) { name in
                            Button(action: { }, label: {
                                Image(systemName: name)
                                    .foregroundColor(.green)
                                    .font(.system(size: 20, weight: .semibold))
                            })
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    ProductCardView()
}
