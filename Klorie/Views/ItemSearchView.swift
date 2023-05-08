//
//  ItemSearchView.swift
//  Klorie
//
//  Created by Timea Bartha on 8/5/23.
//

import SwiftUI

struct ItemSearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        BarcodeScannerView()
                    } label: {
                        Label("Scan", systemImage: "barcode.viewfinder")
                                
                        }
                    }
                }
           
            Spacer()
        }
    }
}

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView()
    }
}
