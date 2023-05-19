//
//  InfoSheetView.swift
//  Klorie
//
//  Created by Timea Bartha on 26/4/23.
//

import SwiftUI

struct CalculatorInfoSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack {
            Spacer()
            Text("Calculate the number of daily calories your body needs to maintain, lose, or gain weight using the calorie calculator.")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            
            Text("Note: If you're pregnant or nursing, a competitive athlete, or have a metabolic disorder like diabetes, the calorie calculator may overestimate or underestimate your real calorie needs.")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            
            VStack(alignment:.leading,spacing: 10){
                Text(" ⦿ Sedentary - little or no exercise")
                Text(" ⦿ Lightly active - exercise 1–3 days/week")
                Text(" ⦿ Moderately active - exercise 3–5 days/week")
                Text(" ⦿ Active - exercise 6–7 days/week")
                Text(" ⦿ Very active - hard exercise 6–7 days/week")
            }.foregroundColor(.primary)
            Spacer()
            Spacer()
        }
        .padding()
        .overlay(backButton , alignment: .topLeading)
    }
}

struct CalculatorInfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorInfoSheetView()
    }
}
extension CalculatorInfoSheetView {
    private var backButton:some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label:{
            Image(systemName: "xmark")
                .font(.headline)
                .padding(10)
                .foregroundColor(.primary)
                .background(.ultraThickMaterial)
                .cornerRadius(12)
                .shadow(radius: 4)
                .padding()
        }
    }
}
