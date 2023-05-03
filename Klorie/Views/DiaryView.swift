//
//  MenuView.swift
//  Klorie
//
//  Created by Timea Bartha on 6/4/23.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        NavigationView {
            List {
                Section() {
                    Text("Breakfast")
                    //Foreach for items that are added
                    Button {
                        
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }.headerProminence(.increased)
                
                Section() {
                    Text("Lunch")
                    //Foreach for items that are added
                    Button {
                        
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }.headerProminence(.increased)
                
                Section() {
                    Text("Dinner")
                    //Foreach for items that are added
                    Button {
                        
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }.headerProminence(.increased)
                
                Section() {
                    Text("Snacks")
                    //Foreach for items that are added
                    Button {
                        
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }.headerProminence(.increased)
                
            }.listStyle(GroupedListStyle())
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
