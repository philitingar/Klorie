//
//  DataController.swift
//  Klorie
//
//  Created by Timea Bartha on 29/6/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "KlorieDataModel")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to lead: \(error.localizedDescription)")
            }
        }
    }
}


