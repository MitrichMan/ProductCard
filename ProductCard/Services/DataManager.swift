//
//  DataManager.swift
//  ProductCard
//
//  Created by Dmitrii Melnikov on 31.01.2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    let trailingNavBarItems = [
        "doc.plaintext",
        "tray.and.arrow.up",
        "heart"
    ]
    
    let characteristicsFieldNames: [CharacteristicsFieldName] = [
        .manufactured,
        .energyValue,
        .fats,
        .carbohydrates,
        .proteins,
        .category,
        .species,
        .type,
        .nettoWeight,
        .volume,
        .brand,
        .country,
        .standart,
        .storageLife,
        .minimumStorageTemperature,
        .maximumStorageTemperature
    ]
    
    var reviews: [Rewiew] = []
    
    private init() {}
    
    func getProduct() -> Product {
        Product(
            name: "Набор Конфет Raffaello 150г",
            productImageLink: "https://s.myspar.ru/upload/img/10/1010/101002.jpg?1580739557",
            promotionDescription: "Цена по карте",
            countryOfManufacture: "Россия",
            regionOfManufacture: "Владимирская область",
            discount: 0, 
            description: "Хрустящие кокосовые конфеты с цельным миндальным орехом. Raffaello – самые известные и любимые конфеты в России, ставшие неотъемлемой частью жизни. Такой успех стал возможным благодаря уникальному сочетанию неповторимого вкуса, изысканной белоснежной упаковки и, конечно, романтического имиджа.", 
            price: 399.9, 
            pricePer: .unit, 
            characteristics: getCharacteristics()
        )
    }
    
    func getCharacteristics() -> Characteristics {
        Characteristics(
            energyValue: "628",
            fats: "48.6",
            carbohydrates: "38.2",
            proteins: "7.2",
            category: "Наборы конфет",
            species: "Не Шоколадные",
            type: "Наборы конфет",
            nettoWeight: 0.15,
            volume: 0.15,
            brand: "Raffaello",
            country: "Россия",
            standart: "ТУ 9124-003-42295149-09",
            storageLife: "9 месяцев",
            minimumStorageTemperature: "- 15",
            maximumStorageTemperature: "- 21"
        )
    }
    
    func makeRewiews() {
        var count = 0
        while count < 10 {
            reviews.append(
                Rewiew(
                    reviewerName: "Светлана",
                    date: "26 Ноября 2023",
                    mark: Double.random(in: 4...5),
                    reviewText: "Конфеты очень вкусные!!!"
                )
            )
            count += 1
        }
    }
}

enum CharacteristicsFieldName: String {
    case manufactured = "Производство"
    case energyValue = "Энергетическая ценность, ккал/100 г"
    case fats = "Жиры/100 г"
    case carbohydrates = "Белки/100 г"
    case proteins = "Углеводы/100 г"
    case category = "Категория"
    case species = "Вид продукта"
    case type = "Тип товара"
    case nettoWeight = "Вес нетто"
    case volume = "Объем"
    case brand = "Бренд"
    case country = "Страна"
    case standart = "ТУ/ГОСТ"
    case storageLife = "Срок хранения"
    case minimumStorageTemperature = "Температура хранения, мин °C"
    case maximumStorageTemperature = "Температура хранения, макс °C"
}
