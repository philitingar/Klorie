//
//  ContentView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                NutrientsView()
                    .padding(40)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

