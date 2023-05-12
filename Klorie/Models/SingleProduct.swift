//
//  SingleProduct.swift
//  Klorie
//
//  Created by Timea Bartha on 3/5/23.
/// To parse the JSON, add this file to your project and do:
//
//   let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)


import SwiftUI
// MARK: - Product Response

struct ProductResponse: Codable {
    var code: String
    var status: Int
    var product: SingleProduct
    var statusVerbose: String
    
    enum CodingKeys: String, CodingKey {
            case code, product, status
            case statusVerbose = "status_verbose"
        }

}

// MARK: - Single Product

struct SingleProduct: Codable, Identifiable {
    var id: String
    var keywords: [String]
    var nutriments: SingleProductNutriments
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case keywords = "_keywords"
        case nutriments
    }
}

// MARK: - Single Product Nutriments

struct SingleProductNutriments: Codable {
    var carbohydrates, carbohydrates100G, carbohydratesServing: Double
    var carbohydratesUnit: String
    let fat, fat100G, fatServing: Int
    var fatUnit: String
    var fiber, fiber100G, fiberServing: Int
    var fiberUnit: String
    var proteins, proteins100G, proteinsServing: Int
    var proteinsUnit: String
    var salt, salt100G, saltServing: Double
    var saltUnit: String
    var sodium, sodium100G, sodiumServing: Double
    var sodiumUnit: String
    var sugars, sugars100G, sugarsServing: Double
    var sugarsUnit: String
    
    enum CodingKeys: String, CodingKey {
        case carbohydrates
        case carbohydrates100G = "carbohydrates_100g"
        case carbohydratesServing = "carbohydrates_serving"
        case carbohydratesUnit = "carbohydrates_unit"
        case fat
        case fat100G = "fat_100g"
        case fatServing = "fat_serving"
        case fatUnit = "fat_unit"
        case fiber
        case fiber100G = "fiber_100g"
        case fiberServing = "fiber_serving"
        case fiberUnit = "fiber_unit"
        case proteins
        case proteins100G = "proteins_100g"
        case proteinsServing = "proteins_serving"
        case proteinsUnit = "proteins_unit"
        case salt
        case salt100G = "salt_100g"
        case saltServing = "salt_serving"
        case saltUnit = "salt_unit"
        case sodium
        case sodium100G = "sodium_100g"
        case sodiumServing = "sodium_serving"
        case sodiumUnit = "sodium_unit"
        case sugars
        case sugars100G = "sugars_100g"
        case sugarsServing = "sugars_serving"
        case sugarsUnit = "sugars_unit"
    }
    
}

