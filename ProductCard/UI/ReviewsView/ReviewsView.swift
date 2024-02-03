//
//  ReviewsView.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 01.02.2024.
//

import SwiftUI

struct ReviewsView: View {
    let reviews: [Rewiew]
    
    var body: some View {
        VStack {
            HStack {
                Text("Отзывы")
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                Text("Все \(reviews.count)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.green)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    
                    ForEach(reviews, id: \.self) { review in
                        
                        ZStack {
                            Color.white
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.2),radius: 8)
                            
                            VStack(alignment: .leading) {
                                Text(review.reviewerName)
                                
                                Text(review.date)
                                
                                HStack {
                                    ForEach(0..<5, id: \.self) { _ in
                                        Image(systemName: "star.fill")
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
                Text("Оставить отзыв")
            })
        }
    }
}



#Preview {
    ReviewsView(reviews: [
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        ),
        Rewiew(
            reviewerName: "Светлана",
            date: "26 Ноября 2023",
            mark: 5,
            reviewText: "Конфеты очень вкусные!!!"
        )
    ])
}
