//
//  NutrientsView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI
import SwiftPieChart

struct NutrientsView: View {
    var body: some View {
       PieChartView(
        values: [300, 200, 800],
        names: ["Carbs", "Proteins", "Fats"],
        formatter: {value in String(format: "%.0f kcal", value)},
        colors: [Color(red: 255/255, green: 69/255, blue: 0/255),Color(red: 255/255, green: 215/255, blue: 0/255),Color(red: 255/255, green: 140/255, blue: 0/255)]
       )
                    
    }
}

struct NutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsView()
    }
}
