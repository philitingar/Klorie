//
//  ItemSearchView.swift
//  Klorie
//
//  Created by Timea Bartha on 8/5/23.
//

import SwiftUI

struct ItemSearchView: View {
    @State private var searchText = ""
    @State var searchResult : ProductSearch?
    @State var productResponse : ProductResponse?
    
    @State var searchItemURL = "https://world.openfoodfacts.org/api/v2/search?sort_by=unique_scans_n&fields=code,product_name,categories,brands,brands_imported,nutrition_data,serving_size,id&brands_tags="
    
    var body: some View {
        VStack {
            
            List {
                if let result = self.searchResult {
                    ForEach(result.products) { product in
                       // Section(header: Text(product.id)) {
                        NavigationLink {
                            SingleProductDetailView(selectedProduct: product)
                        } label: {
                            Text(product.productName ?? product.brands)
                                .bold()
                                .foregroundColor(.primary)

                        }
                            
                            
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .onChange(of: searchText, perform: { newValue in
                if !newValue.isEmpty && newValue.count > 2 {
                     loadData(itemName: newValue)
                } else {
                    searchResult = nil
                }
            })
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        BarcodeScannerView()
                    } label: {
                        Label("Scan", systemImage: "barcode.viewfinder")
                        
                    }
                }
            }   
            .navigationBarTitle("", displayMode: .inline)
        
    }
    
    func loadData(itemName: String) {
        self.searchResult = nil
        let path = itemName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: (searchItemURL + path))
        guard let url = url else {
            return
        }
        print("DEBUG: Searching for \(url)")
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                return
            }
            print("DEBUG: Received Data")

            do {
                self.searchResult = try JSONDecoder().decode(ProductSearch.self, from: data)
            } catch {
                print("DEBUG: Failed to Parse. error: \(error)")
                return
            }
        }.resume()
    }
    
}
    


struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        let productResponse = Bundle.main.decode(ProductResponse.self, from: "SingleProduct.json")
        

        ItemSearchView(productResponse: productResponse)
    }
}
