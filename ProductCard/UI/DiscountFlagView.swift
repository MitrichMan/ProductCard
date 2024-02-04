//
//  DiscountFlagView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 04.02.2024.
//

import SwiftUI

struct DiscountFlagView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: width / 2, y: -height),
                    radius: height + height ,
                    startAngle: .degrees(109.5),
                    endAngle: .degrees(70.5),
                    clockwise: true
                )
                
                path.addLine(to: CGPoint(x: width * 0.9, y: height * 0.15))

                path.addCurve(
                    to: CGPoint(x: 0, y: height * 0.4),
                    control1: CGPoint(x: width * 0.75, y: height * 0.25),
                    control2: CGPoint(x: width * 0.25, y: height * 0.5)
                )
                
               
            }
            .foregroundColor(.red)
        }
        .frame(width: 40, height: 30)
    }
}

#Preview {
    DiscountFlagView()
}
