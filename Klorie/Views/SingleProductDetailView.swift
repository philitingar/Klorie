//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)

import SwiftUI

struct SingleProductDetailView: View {
    @State var productresponse = Bundle.main.decode(ProductResponse.self, from: "SingleProduct.json")
    @State var searchresult = Bundle.main.decode(ProductSearch.self, from: "SearchResults.json")
    

    
    var body: some View {
        List {
            Text("Product name")
                .font(.headline)
                .foregroundColor(.primary)
            HStack(alignment: .firstTextBaseline) {
                Text("Total cal")
                
                    
            }
        }
        }
    }


struct SingleProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SingleProductDetailView()
    }
}
