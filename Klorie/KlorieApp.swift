//
//  KlorieApp.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

@main
struct KlorieApp: App {
    @StateObject var vm : MealViewModel = MealViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(vm)
                
        }
    }
}
