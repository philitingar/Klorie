//
//  ProductSearchResult.swift
//  Klorie
//
//  Created by Timea Bartha on 3/5/23.
//

import SwiftUI
// To parse the JSON, add this file to your project and do:
//
//   let productSearch = try? JSONDecoder().decode(ProductSearch.self, from: jsonData)

import Foundation

// MARK: - ProductSearch
struct ProductSearch: Codable {
    var count, page, pageCount, pageSize: Int
    var products: [ProductSearchItem]
    var skip: Int

    enum CodingKeys: String, CodingKey {
        case count, page
        case pageCount = "page_count"
        case pageSize = "page_size"
        case products, skip
    }
}

// MARK: - ProductSearchItem
struct ProductSearchItem: Codable, Identifiable {
    var brands: String
    var categories: String?
    var id: String
    var nutritionData: NutritionData?
    var servingSize, productName: String?

    enum CodingKeys: String, CodingKey {
        case brands, categories, id
        case nutritionData = "nutrition_data"
        case servingSize = "serving_size"
        case productName = "product_name"
    }
}

enum NutritionData: String, Codable {
    case on = "on"
    case off = "null"
}
