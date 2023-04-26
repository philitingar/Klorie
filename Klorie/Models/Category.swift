//
//  Category.swift
//  Klorie
//
//  Created by Timea Bartha on 26/4/23.
//

import Foundation

struct Category: Identifiable {
    
    let id = UUID().uuidString
    var title: String
    var image: String
}
