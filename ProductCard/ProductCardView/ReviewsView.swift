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
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    
                    ForEach(reviews, id: \.self) { review in
                        
                        ZStack {
                            Color.white
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.3),radius: 12)
                            
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
                .padding(.vertical, 20)
            }
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
