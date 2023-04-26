//
//  ContentView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: MealViewModel
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                NutrientsView()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MealViewModel())
    }
}

