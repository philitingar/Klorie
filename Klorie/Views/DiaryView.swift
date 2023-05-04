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
            
            // can insert days or calendar here
            List {
                Section() {
                    HStack {
                        Text("Breakfast")
                        Spacer()
                        Text("100")// this is calorie count that will be the total for breakfast
                    }
                    //Foreach for items that are added, include HStack for calorie count
                    Button {
                        print("Breakfast button pressed")
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }
                
                Section() {
                    HStack {
                        Text("Lunch")
                        Spacer()
                        Text("100")// this is calorie count that will be the total for lunch
                    }
                    //Foreach for items that are added, include HStack for calorie count
                    Button {
                        print("Lunch button pressed")
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }
                
                Section() {
                    HStack {
                        Text("Dinner")
                        Spacer()
                        Text("100") //this is calorie count that will be the total for dinner
                    }
                    //Foreach for items that are added, include HStack for calorie count
                    Button {
                        print("Dinner button pressed")
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }
                
                Section() {
                    HStack {
                        Text("Snacks")
                        Spacer()
                        Text("100")//this is calorie count that will be the total for snacks
                    }
                    //Foreach for items that are added, include HStack for calorie count
                    Button {
                        print("Snacks button pressed")
                    } label: {
                        Text("ADD FOOD")
                            .bold()
                    }
                }
                
            }.navigationTitle("Diary")
            .listStyle(GroupedListStyle())
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
