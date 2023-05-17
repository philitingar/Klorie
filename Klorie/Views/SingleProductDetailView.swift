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
    
    @State var servings = ""
    
    var body: some View {
        List {
            if let product = singleProduct {
                Section(header: Text("Product")) {
                    VStack(alignment: .leading) {
                        Text(product.code)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(product.data.productName)
                    }
                }
                Section(header: Text("Calories")) {
                    TextField("Enter amount", text:$servings).keyboardType(.decimalPad)
                    
                    HStack {
                        Text("Calories for selected serving:")
                        Spacer()
                        Text(String(format: "%.2f", product.data.nutriments.energyKcal100g))
                    }
                    
                }
                Section(header: Text("Nutrients")) {
                    VStack {
                        HStack {
                            Text("Carbs")
                            Spacer()
                            Text(String(format: "%.2f", product.data.nutriments.carbohydrates100G))
                            Spacer()
                            Text(product.data.nutriments.carbohydratesUnit)
                        }.padding()
                        HStack {
                            Text("Fat")
                            Spacer()
                            Text(String(format: "%.2f", product.data.nutriments.fat100G))
                            Spacer()
                            Text(product.data.nutriments.fatUnit)
                        }.padding()
                        HStack {
                            Text("Protein")
                            Spacer()
                            Text(String(format: "%.2f", product.data.nutriments.proteins100G))
                            Spacer()
                            Text(product.data.nutriments.proteinsUnit)
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

