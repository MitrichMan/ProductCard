//
//  CountryOfManufactureView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

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
                .font(.system(size: 16))
        }
    }
}
