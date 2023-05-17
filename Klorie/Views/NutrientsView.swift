//
//  NutrientsView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI


struct NutrientsView: View {
    var body: some View {
        
        ZStack {
            
            PieChartView(
                values: [300, 200, 150],
                names: ["Carbs", "Proteins", "Fats"],
                formatter: {value in String(format: "%.0f kcal", value)},
                colors: [Color(red: 202/255, green: 144/255, blue: 126/255),Color(red: 114/255, green: 155/255, blue: 121/255),Color(red: 93/255, green: 93/255, blue: 129/255)]
            )
        }
                    
    }
}

struct NutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsView()
    }
}
