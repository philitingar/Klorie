//
//  ContentView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        
        HStack {
            VStack {
                NutrientsView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

