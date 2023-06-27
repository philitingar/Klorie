//
//  AddProductView.swift
//  Klorie
//
//  Created by Timea Bartha on 27/6/23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(.ultraThinMaterial)
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct AddProductView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink {
                        ItemSearchView()
                    } label: {
                        Text("Search")
                            .font(.title2)
                    }
                    .buttonStyle(GrowingButton())
                    .padding(2)
                    
                    NavigationLink {
                        BarcodeScannerView()
                    } label: {
                        Text("Search Barcode")
                            .font(.title2)
                    }
                    .buttonStyle(GrowingButton())
                    .padding(2)
                    
                    
                }
                
                Spacer()
                List {
                    Section(header: Text("Previously searched products")) {
                        Text("Items")
                    }
                }
                
            }
        }.navigationTitle("Search by:")
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
