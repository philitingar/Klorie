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
        
        ZStack {
            BackgroundView()
            PieChartView(
                values: [300, 200, 150],
                names: ["Carbs", "Proteins", "Fats"],
                formatter: {value in String(format: "%.0f kcal", value)},
                colors: [Color(red: 229/255, green: 107/255, blue: 111/255),Color(red: 227/255, green: 170/255, blue: 146/255),Color(red: 100/255, green: 180/255, blue: 163/255)]
            )
        }
                    
    }
}

struct NutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsView()
    }
}
