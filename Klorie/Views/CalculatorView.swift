//
//  CalculatorView.swift
//  Klorie
//
//  Created by Timea Bartha on 11/4/23.
//

import SwiftUI

extension View{
    func dismissKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil,from: nil,for: nil)
    }
}
struct CalculatorView: View {
    @State var age = ""
    @State var height:String = ""
    @State var weight:String = ""
    @State var userTargetKcal:String = ""
    
    @State var gender:String = "Male"
    @State var activity:String = "Sedentary"
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    @State var showInfoSheet:Bool = false
    
    
    let genderSelection: [String] = [
        "Male","Female"
    ]
    
    let activitySelection: [String] = [
        "Sedentary","Lightly active","Moderately active","Active","Very active"
    ]
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor =
        UIColor(red: 175/255, green: 101/255, blue: 181/255, alpha: 1)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 100/255, green: 180/255, blue: 163/255, alpha: 1)]
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 41/255, green: 62/255, blue: 87/255)
                    .ignoresSafeArea()
                VStack {
                    
                    VStack {
                        
                        TextFieldInputsCalcButton
                        
                        Button{
                          
                            resetTextField()
                            showAlert.toggle()
                        }label: {
                            Text("Calculate")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height:55)
                                .frame(maxWidth:120)
                                .background(textFieldisValid() ?
                                            Color(red: 175/255, green: 101/255, blue: 181/255) : Color.gray)
                                .cornerRadius(10)
                                .padding()
                            
                            
                        }
                        
                        TargetUserKcalSection
                    }
                    .padding()
                    Spacer()
                }
                
            }.navigationTitle("Calorie Calculator")
                .sheet(isPresented: $showInfoSheet) {
                    InfoSheetView()
                }
                
        }
    }
    func textFieldisValid() -> Bool {
        if(age.count < 2 || weight.count < 2 || height.count < 3){
            return false
        }
        return true
    }
    func directKcalTextFieldValidation() -> Bool {
        if(userTargetKcal.count < 3){
            return false
        }
        return true
    }
    
    func resetTextField() {
        height = ""
        age = ""
        weight = ""
        userTargetKcal = ""
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

extension CalculatorView {
    
    private var InfoButton:some View {
        HStack {
            Spacer()
            Button {
                showInfoSheet.toggle()
            } label: {
                Image(systemName: "info.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30)
                    .foregroundColor(.white)
            }
        }
    }
    private var TextFieldInputsCalcButton:some View {
        VStack{
            
            TextField("Age",text: $age)
                .padding(.horizontal)
                .frame(height:45)
                .background(Color.white.opacity( 0.8))
                .cornerRadius(10)
                .font(.title)
                .keyboardType(.decimalPad)
            
            TextField("Height",text: $height)
                .padding(.horizontal)
                
                .frame(height:45)
                .background(Color.white.opacity( 0.8))
                .cornerRadius(10)
                .font(.title)
                .keyboardType(.decimalPad)
            
            TextField("Weight",text: $weight)
                .padding(.horizontal)
                .frame(height:45)
                .background(Color.white.opacity( 0.8))
                .cornerRadius(10)
                .font(.title)
                .keyboardType(.decimalPad)
            
            
            Picker(
                selection:$gender,
                   label:Text("Gender"),
                   content:{
                ForEach(genderSelection.indices,id:\.self){ index in
                    Text(genderSelection[index])
                        .tag(genderSelection[index])
                        
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            InfoButton
            HStack {
                Text("Choose your activity :")
                    .font(.headline)
                    .foregroundColor(.white)
                Picker(
                    selection:$activity,
                    label:Text("Activity"),
                    content:{
                        ForEach(activitySelection.indices,id:\.self){ index in
                            Text(activitySelection[index])
                                .tag(activitySelection[index])
                            
                        }
                    })
                .pickerStyle(MenuPickerStyle())
                .tint(.white)
            }
            .frame(maxWidth:.infinity)
        }
    }
    private var TargetUserKcalSection:some View{
        VStack{
            TextField("Insert kcal directly",text: $userTargetKcal)
                .padding(.horizontal)
                .frame(height:40)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .font(.headline)
                .keyboardType(.decimalPad)
            if directKcalTextFieldValidation(){
                Button{
                    
                    resetTextField()
                }label: {
                    Image(systemName:"checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25,height: 20)
                }
            }
        }
    }
   
}
