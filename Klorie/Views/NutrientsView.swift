//
//  NutrientsView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI
import CoreData

struct NutrientsView: View {
    let dataController = DataController.shared

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [])
    private var users: FetchedResults<User>


    var body: some View {

        ZStack {
            
            PieChartView(
                values: [100, 200, 340],
                names: ["Carbs", "Proteins", "Fats"],
                formatter: {value in String(format: "%.0f kcal", value)},
                colors: [Color(red: 202/255, green: 144/255, blue: 126/255),Color(red: 114/255, green: 155/255, blue: 121/255),Color(red: 93/255, green: 93/255, blue: 129/255)]
            )
            .environment(\.managedObjectContext, dataController.container.viewContext)
            
            ForEach(users) { user in
                Text("\(user.age)")
                    .padding(.horizontal)
                    .font(.title)
            }
        }
                    
    }
}

struct NutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsView()
    }
}
