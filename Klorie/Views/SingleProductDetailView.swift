//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)
import Combine
import SwiftUI

struct SingleProductDetailView: View {
    
    @State var selectedProduct: ProductSearchItem
    @State var singleProduct: ProductResponse?
    
    let singleItemURI = "https://off:off@world.openfoodfacts.org/api/v2/product/"
    
    @State var servings = 100.0
    @State var carbs = 0.0
    @State var fat = 0.0
    @State var protein = 0.0
    @State var calories = 0.0
    
    @State private var isNutriscoreValue = false
    @State var nutriScore = "a"
    @State var scoreColor: Color = .secondary
    
    
    
    var body: some View {
        List {
            if let product = singleProduct {
                // MARK: Product
                Section(header: Text("Product")) {
                    VStack(alignment: .leading) {
                        Text(product.code)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(product.data.productName)
                    }
                }
                // MARK: Calories
                Section(header: Text("Calories")) {
                    TextField("Enter amount(g)", value: $servings, format: .number)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(servings), perform: { newValue in
                            self.fat = (product.data.nutriments.fat100G/100) * newValue
                            self.protein = (product.data.nutriments.proteins100G/100) * newValue
                            self.carbs = (product.data.nutriments.carbohydrates100G/100) * newValue
                            
                        })
                    
                    HStack {
                        Text("Calories for selected serving:")
                        Spacer()
                        Text(String(format: "%.2f", calories))
                            .onReceive(Just(servings), perform: { newValue in
                                self.calories = (product.data.nutriments.energyKcal100g/100) * newValue
                            })
                    }
                    
                }
                // MARK: Nutrients
                Section(header: Text("Nutrients")) {
                    VStack {
                        HStack {
                            Text("Carbs")
                            Spacer()
                            Text(String(format: "%.2f", carbs))
                            Spacer()
                            Text(product.data.nutriments.carbohydratesUnit)
                        }.padding()
                        HStack {
                            Text("Fat")
                            Spacer()
                            Text(String(format: "%.2f", fat))
                            Spacer()
                            Text(product.data.nutriments.fatUnit)
                        }.padding()
                        HStack {
                            Text("Protein")
                            Spacer()
                            Text(String(format: "%.2f", protein))
                            Spacer()
                            Text(product.data.nutriments.proteinsUnit)
                        }.padding()
                    }
                    
                }
                // MARK: Nutriscore
                if self.nutriScore == "" {
                    
                } else {
                    Section(header: Text("Nutriscore")) {
                        ZStack(alignment: .center ){
                            HStack(alignment: .center) {
                                if self.nutriScore == "a" {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.green)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("A")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.secondary)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("A")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                }
                                
                                if self.nutriScore == "b" {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.mint)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("B")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.secondary)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("B")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                }
                                if self.nutriScore == "c" {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.green)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("B")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.secondary)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("B")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                }
                                if self.nutriScore == "d" {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.green)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("D")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.secondary)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("D")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                }
                                if self.nutriScore == "e" {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.red)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("E")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.secondary)
                                        .frame(width: 40, height: 45)
                                        .padding(-3)
                                        .overlay(
                                            Text("E")
                                                .font(.largeTitle)
                                                .bold()
                                        )
                                }
                                
                            }.padding(1)
                        }
                        
                    }
                }
            }
        }.onAppear(perform: loadData)
            .onTapGesture {
                self.hideKeyboard(focus: true)
            }
    }
    // MARK: LoadData
    func loadData() {
        self.singleProduct = nil
        print("looking server call")
        let url = URL(string: (singleItemURI + selectedProduct.id))
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            print("done with server call")
            let loadedProduct = try! JSONDecoder().decode(ProductResponse.self, from: data!)
            print("done decoding")
            self.singleProduct = loadedProduct
            self.fat = loadedProduct.data.nutriments.fat100G
            self.protein = loadedProduct.data.nutriments.proteins100G
            self.carbs = loadedProduct.data.nutriments.carbohydrates100G
            self.calories = loadedProduct.data.nutriments.energyKcal100g
            self.nutriScore = loadedProduct.data.nutriscoreData.grade
            
            
        }.resume()
    }
    // MARK: Hide Keyboard
    func hideKeyboard(focus: Bool) {
        if focus {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    func nutriScoreValueChanged() {
        if nutriScore == "a" {
            isNutriscoreValue = true
        } else if nutriScore == "b" {
            isNutriscoreValue = true
        }  else if nutriScore == "c" {
            isNutriscoreValue = true
        } else if nutriScore == "d" {
            isNutriscoreValue = true
        } else if nutriScore == "e" {
            isNutriscoreValue = true
        }
        
        
    }
}

struct SingleProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let searchResult = Bundle.main.decode(ProductSearch.self, from: "SearchResults.json")
        let selectedProduct = searchResult.products.first
        
        SingleProductDetailView(selectedProduct: selectedProduct!)
    }
}

