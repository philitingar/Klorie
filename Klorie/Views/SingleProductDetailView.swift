//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)

import SwiftUI

struct SingleProductDetailView: View {
    @State var productresponse = Bundle.main.decode(ProductResponse.self, from: "SingleProduct.json")
    @State var searchResult: ProductSearchItem
    
    var body: some View {
        List {
            Text(searchResult.id)
                .font(.headline)
                .foregroundColor(.primary)
            HStack(alignment: .firstTextBaseline) {
                Text("Total cal")
                
                
            }
        }
    }
}


