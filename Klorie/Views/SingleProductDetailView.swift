//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)

import SwiftUI

struct SingleProductDetailView: View {
   
    @Binding var singleProduct: ProductResponse?
    
    var body: some View {
        if let product = singleProduct {
            List {
                Text(product.code)
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack(alignment: .firstTextBaseline) {
                    Text("Total cal")
                    
                    
                }
            }
        }
    }
}


