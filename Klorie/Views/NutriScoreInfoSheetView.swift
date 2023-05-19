//
//  NutriScoreInfoSheetView.swift
//  Klorie
//
//  Created by Timea Bartha on 19/5/23.
//

import SwiftUI

struct NutriScoreInfoSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            Text("* Nutri-Score (also called 5-Colour Nutrition Label) is an easy-to-understand, science-based nutritional value labelling system for food and beverages.")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(20)
            
            Text("* A Nutri-Score calculation pinpoints the nutritional value of a product (based on the ingredients) and assigns it to one of the five colour-coded letter grade classes (A, B, C, D, or E). Products that get an A score have the highest nutritional value — those that score an E have the lowest nutritional value.")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(20)
            
            Text("* Nutri-Score is not a mandatory labelling system but more and more EU countries are recommending it (including France, Germany, Belgium, Netherlands, Spain, and Luxemburg). ")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(20)
            
            Spacer()
            Spacer()
        }
        .overlay(backButton , alignment: .topLeading)
    }
}
struct NutriScoreInfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NutriScoreInfoSheetView()
    }
}
extension NutriScoreInfoSheetView {
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
