//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)

import SwiftUI

struct SingleProductDetailView: View {
    
    @State var selectedProduct: ProductSearchItem
    @State var singleProduct: ProductResponse?
    let singleItemURI = "https://off:off@world.openfoodfacts.org/api/v2/product/"
    @State var numberOfServings = "1"
    @State var servings = ["1 g", "100 g"]
    
    
    var body: some View {
        List {
            if let product = singleProduct {
                Section(header: Text("Product")) {
                    VStack(alignment: .leading) {
                        Text(product.code)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("Product name")
                    }
                }
                Section(header: Text("Calories")) {
                    
                
                
                    Picker("Servings", selection: $numberOfServings) {
                        ForEach(servings, id: \.self) { item in
                            Text(item)
                        }
                    }
                    HStack {
                        Text("Calories for selected serving:")
                        Spacer()
                        Text(numberOfServings)
                    }
                    
                }
                Section(header: Text("Nutrients")) {
                    VStack {
                        HStack {
                            Text("Carbs")
                            Spacer()
                            Text("Gramms")
                            Spacer()
                            Text("%")
                        }.padding()
                        HStack {
                            Text("Fat")
                            Spacer()
                            Text("Gramms")
                            Spacer()
                            Text("%")
                        }.padding()
                        HStack {
                            Text("Protein")
                            Spacer()
                            Text("Gramms")
                            Spacer()
                            Text("%")
                        }.padding()
                    }
                    
                }
            }
        }.onAppear(perform: loadData)
    }
    
    
    
    func loadData() {
        self.singleProduct = nil
        print("looking server shit")
        let url = URL(string: (singleItemURI + selectedProduct.id))
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            print("done with server shit")
            let products = try! JSONDecoder().decode(ProductResponse.self, from: data!)
            print("done decoding")
            self.singleProduct = products
        }.resume()
    }
}

struct SingleProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let searchResult = Bundle.main.decode(ProductSearch.self, from: "SearchResults.json")
        let selectedProduct = searchResult.products.first

        SingleProductDetailView(selectedProduct: selectedProduct!)
    }
}
