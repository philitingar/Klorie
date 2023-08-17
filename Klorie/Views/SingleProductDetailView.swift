//
//  SingleProductDetailView.swift
//  Klorie
//
//  Created by Timea Bartha on 9/5/23.
// let productresponse = try? JSONDecoder().decode(ProductResponse.self, from: jsonData)
import Combine
import SwiftUI
import CoreData



struct SingleProductDetailView: View {
    
    @State var selectedProduct: ProductSearchItem
    @State var singleProduct: ProductResponse?
    
    let singleItemURI = "https://off:off@world.openfoodfacts.org/api/v2/product/"
    
    @State var servings = 100.0
    @State var carbs = 0.0
    @State var fat = 0.0
    @State var protein = 0.0
    @State var calories = 0.0
    
    @State var nutriScore = "a"
    @State var scoreColor:Color = .secondary
    
    @State var showInfoSheet:Bool = false

    @State var  nutriScores = [
        "a": Color.green,
        "b": Color.mint,
        "c": Color.yellow,
        "d": Color.orange,
        "e": Color.red
    ]
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [])
    private var users: FetchedResults<User>
 
    var body: some View {
        
            List {
                if let product = singleProduct {
                    
                        // MARK: Product
                        Section(header: Text("Product")) {
                            VStack(alignment: .leading) {
                                Text(product.code)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(product.data.productName ?? "None")
                            }
                        }
                        // MARK: Calories
                        Section(header: Text("Enter the amount of desired Calories")) {
                            TextField("Enter amount(g)", value: $servings, format: .number)
                                .keyboardType(.decimalPad)
                                .onReceive(Just(servings), perform: { newValue in
                                    self.fat = (product.data.nutriments.fat100G ?? 0.0/100) * newValue
                                    self.protein = (product.data.nutriments.proteins100G ?? 0.0/100) * newValue
                                    self.carbs = (product.data.nutriments.carbohydrates100G ?? 0.0/100) * newValue
                                    
                                   
                                })
                            
                            HStack {
                                Text("Calories for selected serving:")
                                Spacer()
                                Text(String(format: "%.2f", calories))
                                    .onReceive(Just(servings), perform: { newValue in
                                        self.calories = (product.data.nutriments.energyKcal100G ?? 0.0/100) * newValue
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
                                    Text(product.data.nutriments.carbohydratesUnit ?? "None")
                                }.padding()
                                HStack {
                                    Text("Fat")
                                    Spacer()
                                    Text(String(format: "%.2f", fat))
                                    Spacer()
                                    Text(product.data.nutriments.fatUnit ?? "None")
                                }.padding()
                                HStack {
                                    Text("Protein")
                                    Spacer()
                                    Text(String(format: "%.2f", protein))
                                    Spacer()
                                    Text(product.data.nutriments.proteinsUnit ?? "None")
                                }.padding()
                            }
                            
                        }
                        // MARK: Nutriscore
                        NutriDataInput
                        
                    
                }
            }.onAppear(perform: loadData)
        
            .simultaneousGesture(TapGesture().onEnded({
                self.hideKeyboard(focus: true)
            }))
            .sheet(isPresented: $showInfoSheet) {
                NutriscoreInfoSheetView()
            }
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Text ("Done")
                        
                    }
                }
            }
        
    }
    // MARK: LoadData
    func loadData() {
        self.singleProduct = nil
        print("DEBUG: Single product:looking server call")
        let url = URL(string: (singleItemURI + selectedProduct.id))
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            print("DEBUG: Single product:done with server call")
            let loadedProduct = try! JSONDecoder().decode(ProductResponse.self, from: data!)
            print("DEBUG: Single product:done decoding")
            self.singleProduct = loadedProduct
            self.fat = loadedProduct.data.nutriments.fat100G ?? 0.0
            self.protein = loadedProduct.data.nutriments.proteins100G ?? 0.0
            self.carbs = loadedProduct.data.nutriments.carbohydrates100G ?? 0.0
            self.calories = loadedProduct.data.nutriments.energyKcal100G ?? 0.0
            self.nutriScore = loadedProduct.data.nutriscoreData?.grade ?? "0"
            
            //svaae product /100
            
            let newProduct = Product(context: moc)
            newProduct.fat100g = Double(fat)
            newProduct.protein100g = Double(protein)
            newProduct.carbs100g = Double(carbs)
            newProduct.kcal100g = Double(calories)
            
//            do {
//                try moc.save()
 //           } catch {
 //               let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
            
        }.resume()
    }
    // MARK: Hide Keyboard
    func hideKeyboard(focus: Bool) {
        if focus {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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

extension SingleProductDetailView {
    
    private var InfoButton:some View {
        HStack {
            Spacer()
            Button {
            } label: {
                Image(systemName: "info.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30)
                    .foregroundColor(.primary)
            }.simultaneousGesture(TapGesture().onEnded({
                showInfoSheet.toggle()
            }))
        }
    }
    private var NutriDataInput: some View {
        Section(header: Text("Nutriscore")) {
            
            if self.nutriScore == "" {
                Text("This item has no Nutri-Score in your country.")
            } else {
                
                
                HStack(alignment: .center) {
                    
                    ForEach(Array(nutriScores.keys).sorted(), id: \.self) { score in
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(self.nutriScore == score ? nutriScores[score]! : .secondary)
                            .frame(width: 40, height: 45)
                            .padding(-3)
                            .overlay(
                                Text(score.capitalized)
                                    .font(.largeTitle)
                                    .bold().foregroundColor(.primary)
                            )
                    }
                    
                    InfoButton
                }
                
                
            }
        }
    }
}
