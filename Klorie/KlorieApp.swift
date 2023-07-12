//
//  KlorieApp.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

@main
struct KlorieApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
