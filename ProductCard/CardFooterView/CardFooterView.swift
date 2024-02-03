//
//  CardFooterView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

enum Units: String, CaseIterable {
    case unit = "Шт"
    case kilo = "Кг"
}
struct CardFooterView: View {
    
    @State var controledValue: Units = .kilo
    @State var quantity = 1
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: .gray.opacity(0.1), radius: 8, y: -16)
            VStack {
                Picker("Test", selection: $controledValue) {
                    ForEach(Units.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("379.9 ₽/кг")
                            .font(.system(size: 25, weight: .semibold))
                        Text("399,9")
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                    
                    Spacer(minLength: 70)
                    
                    TotalPriveStepperView(quantity: $quantity)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    CardFooterView()
}

struct TotalPriveStepperView: View {
    @Binding var quantity: Int
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.green)
            HStack {
                Button(action: {
                    if quantity > 0 {
                        quantity -= 1
                    }
                }, label: {
                    Text("-")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                })
                .padding(.horizontal,8)
                
                VStack {
                    Text("\(quantity)")
                    Text("120₽")
                }
                .foregroundColor(.white)
                
                Button(action: {
                    quantity += 1
                }, label: {
                    Text("+")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                })
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, 16)
        }
    }
}
