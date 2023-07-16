//
//  KlorieApp.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

@main
struct KlorieApp: App {
    let dataController = DataController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
