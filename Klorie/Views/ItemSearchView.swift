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
    
    var body: some View {
            List {
                if let result = self.searchResult {
                    ForEach(result.products) { product in
                        Section(header: Text(product.id)) {
                            Text(product.brands)
                            
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .onChange(of: searchText, perform: { newValue in
                if !newValue.isEmpty {
                    searchResult = Bundle.main.decode(ProductSearch.self, from: "SearchResults.json")
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
    }

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView()
    }
}
