//
//  DataManager.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    let trailingNavBarItems = ["doc.plaintext", "tray.and.arrow.up", "heart"]
    
    private init() {}
    
    func getProduct() -> Product {
        Product(
            name: "Набор Конфет Raffaello 150г",
            productImageLink: "https://s.myspar.ru/upload/img/10/1010/101002.jpg?1580739557",
            promotionDescription: "Цена по карте",
            countryOfManufacture: "Россия",
            regionOfManufacture: "Владимирская область",
            discount: 0, 
            description: "Хрустящие кокосовые конфеты с цельным миндальным орехом. Raffaello – самые известные и любимые конфеты в России, ставшие неотъемлемой частью жизни. Такой успех стал возможным благодаря уникальному сочетанию неповторимого вкуса, изысканной белоснежной упаковки и, конечно, романтического имиджа."
        )
    }
}
