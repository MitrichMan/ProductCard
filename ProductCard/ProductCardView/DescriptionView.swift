//
//  DescriptionView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

struct DescriptionView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Описание")
                .font(.system(size: 18, weight: .semibold))
            
            Text(description)
        }
    }
}

#Preview {
    DescriptionView(description: "hfgjgjk")
}
