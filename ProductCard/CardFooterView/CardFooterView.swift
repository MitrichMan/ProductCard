//
//  CardFooterView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI


struct CardFooterView: View {
    @StateObject private var viewModel = CardFooterViewModel()
    
    @Binding var units: Units
    
    let price: Double
    var discount: Double
    
    var selectedTab: TabName
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: .gray.opacity(0.1), radius: 8, y: -16)
            VStack {
                PriceView(
                    units: $units, 
                    quantity: $viewModel.quantity,
                    price: price, 
                    priceForOne: viewModel.geStringTotalPrice(for: 1, from: price, with: discount),
                    totalPrice: viewModel.geStringTotalPrice(for: viewModel.quantity, from: price, with: discount)
                )
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                
                HStack {
                    ForEach(DataManager.shared.tabNames, id: \.self) { tabName in
                        Button(action: {}, label: {
                            VStack {
                                Image(systemName: viewModel.getPictureName(for: tabName))
                                    .font(.system(size: 30))
                                Text(tabName.rawValue)
                            }
                        })
                        .padding(.horizontal, 8)
                        .foregroundColor(viewModel.getColourName(
                            for: selectedTab, 
                            currentIteration: tabName
                        ))
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        
    }
}

#Preview {
    CardFooterView(units: .constant(.kilo), price: 399.9, discount: 5, selectedTab: .main)
}
