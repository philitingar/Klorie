//
//  DataController.swift
//  Klorie
//
//  Created by Timea Bartha on 29/6/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container: NSPersistentContainer
    static let shared = DataController()

    init() {
        container = NSPersistentContainer(name: "KlorieDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                print("Core data failed to lead: \(error.localizedDescription)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}


