//
//  ReviewsView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

struct ReviewsView: View {    
    var reviews: [Review] 
    
    var body: some View {
        VStack {
            HStack {
                Text("Отзывы")
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Все \(reviews.count)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.green)
                })
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    
                    ForEach(reviews, id: \.self) { review in
                        
                        ZStack {
                            Color.white
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.2),radius: 8)
                            
                            VStack(alignment: .leading) {
                                Text(review.reviewerName)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text(review.date)
                                    .foregroundColor(.gray)
                                
                                ZStack(alignment: .leading) {
                                    HStack {
                                        ForEach(0..<5, id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.gray)
                                                .opacity(0.3)
                                        }
                                    }
                                    
                                    HStack {
                                        ForEach(0..<Int(review.mark), id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                }
                                
                                Text(review.reviewText)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal)
            }
            
            Button(action: {}, label: {
                HStack {
                    Spacer()
                    
                    Text("Оставить отзыв")
                        .foregroundColor(.green)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical, 8)
                    
                    Spacer()
                    
                }
                .overlay(Capsule().stroke(Color.green, lineWidth: 2))
                .padding(.horizontal, 16)
            })
        }
    }
}



#Preview {
    ReviewsView(reviews: DataManager.shared.makeRewiews())
}
