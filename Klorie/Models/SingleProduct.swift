//
//  SingleProduct.swift
//  Klorie
//
//  Created by Timea Bartha on 3/5/23.
//

import SwiftUI

struct ProductResponse: Codable {
    var code: String
    var status: Int
    var product: [SingleProduct]
    var status_vebrose: String

}

struct SingleProduct: Codable, Identifiable {
    var id: String
    var keywords: [String]
    var nutriments: [SingleProductNutriments]
}

struct SingleProductNutriments: Codable {
    var carbohydrates100g: Double
    var fat_100g: Double
    var fiber_100g : Double
    var proteins_100g : Double
    var salt_100g : Double
    var sodium_100g : Double
    var sugars_100g : Double
    
    
}
//var SingleProductNutriments = [
 //   "carbohydrates100g": 6.9,
//    "fat_100g": 0,
//   "fiber_100g": 0,
 //   "proteins_100g": 0,
//    "salt_100g": 0.01,
//    "saturated-fat_100g": 0,
//    "sodium_100g": 0.004,
//    "sugars_100g": 6.8,
//    "energy-kcal_100g": 28,

//]

