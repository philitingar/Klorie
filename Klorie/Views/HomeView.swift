//
//  ContentView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI
import CoreData

struct HomeView: View {

    let dataController = DataController.shared
    @Environment(\.managedObjectContext) var moc //environment property to store our managed object context:
 
    var body: some View {
        HStack {
            VStack {
                NutrientsView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

