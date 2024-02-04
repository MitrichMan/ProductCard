//
//  TrailingNavigationBarItemsView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import SwiftUI

struct TrailingNavigationBarItemsView: View {
    var body: some View {
        ForEach(
            DataManager.shared.trailingNavBarItems,
            id: \.self
        ) { name in
            Button(action: { }, label: {
                Image(systemName: name)
                    .foregroundColor(.green)
                    .font(.system(size: 16, weight: .medium))
            })
        }
    }
}

#Preview {
    HStack {
        TrailingNavigationBarItemsView()
    }
}
