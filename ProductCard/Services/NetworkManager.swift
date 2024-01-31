//
//  NetworkManager.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImageData(from url: String) async throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidURL }
        guard let imageData = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return imageData
    }
}

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

enum API: String {
    case productImage = "https://s.myspar.ru/upload/img/10/1010/101002.jpg?1580739557"
    
}
