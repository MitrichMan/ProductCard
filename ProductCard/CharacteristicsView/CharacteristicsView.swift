//
//  CharacteristicsView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

struct CharacteristicsView: View {
    @StateObject var viewModel = CharacteristicsViewModel()
    
    var product:  Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Основные характеристики")
                .font(.system(size: 18, weight: .semibold))
            
            ForEach(0..<viewModel.fieldsPresented, id: \.self) { index in
                HStack(alignment: .top, spacing: 0) {
                    Text(DataManager.shared.characteristicsFieldNames[index].rawValue)
                        .frame(maxHeight: 60, alignment: .top)
                        .layoutPriority(1)
                    
                    Text(viewModel.dottedSeparator)
                        .frame(maxHeight: 20)
                        .layoutPriority(0)
                    
                    Text(
                        viewModel.getCharacteristicsText(
                            for: DataManager.shared.characteristicsFieldNames[index]
                        )
                    )
                        .frame(maxHeight: 60, alignment: .top)
                        .multilineTextAlignment(.trailing)
                        .layoutPriority(1)
                }
            }
            
            Button(action: {
                viewModel.isFullyPresented.toggle()
            }, label: {
                Text(viewModel.presentationModeButtonName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.green)
                    .padding(.vertical)
            })
        }
        .animation(.default)
        .onAppear(perform: {
            viewModel.product = product
        })
    }
}

#Preview {
    CharacteristicsView(product: DataManager.shared.getProduct())
}
