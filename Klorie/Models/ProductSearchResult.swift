//
//  ProductSearchResult.swift
//  Klorie
//
//  Created by Timea Bartha on 3/5/23.
//

import SwiftUI

struct ProductSearch: Codable {
    var count: Int
    var page: Int
    var page_count: Int
    var page_cize: Int
    var products: [ProductSearchItem]
    
}

struct ProductSearchItem: Codable, Identifiable {
    var brands: String
    var categories: String
    var id: String
    var nutrition_data: String
    var serving_size: String
    
}
