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
    
   // @EnvironmentObject var vm : MealViewModel
    
    
    @State var age = ""
    @State var height:String = ""
    @State var weight:String = ""
    @State var userTargetKcal:String = ""
    
    @State var gender:String = "Male"
    @State var activity:String = "Sedentary"
    @State var weightLoss: String = "Maintan weight"
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    @State var showInfoSheet:Bool = false
    @State var userDailyCal:String = ""
    
    
    let genderSelection: [String] = [
        "Male","Female"
    ]
    
    let activitySelection: [String] = [
        "Sedentary","Lightly active","Moderately active","Active","Very active"
    ]
    
    let weightLossSelection: [String] = ["Maintain weight", "-0,25kg/week", "-0,50kg/week"]
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor =
        UIColor(Color.secondary)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.primary)]
    }
    
    
    var body: some View {
        NavigationView {
                        
            ScrollView {
                VStack {
                    VStack {
                        
                        TextFieldInputsCalcButton
                        
                        Button{
                            kcalCalculator(gender: gender,
                                           activity: activity)
                            
                            resetTextField()
                            
                            showAlert.toggle()
                            
                        } label: {
                            Text("Calculate")
                                .foregroundColor(.primary)
                                .font(.headline)
                                .frame(height:55)
                                .frame(maxWidth:120)
                                .background(textFieldisValid() ?
                                            Color.blue : Color.gray)
                                .cornerRadius(10)
                                .padding()
                            
                            
                        }
                        .disabled(!textFieldisValid())
                        .alert("Recommended daily calories:", isPresented: $showAlert, actions: {
                            
                        }, message: {
                            Text("\(userDailyCal) kcal")
                        })
                        TargetUserKcalSection
                    }
                    .padding()
                    Spacer()
                }
            }
            
        }
        .onTapGesture {
            self.dismissKeyBoard()
        }
        .navigationTitle("Calorie Calculator")
        .foregroundColor(.primary)
        .sheet(isPresented: $showInfoSheet) {
            CalculatorInfoSheetView()
        }
    }
    
    struct GenderCalc {
        var weight: Double
        var height: Double
        var age: Double
        var baseKcal: Double
    }
    
    let calculationVariables: [String: GenderCalc] = [
        "Male": GenderCalc(weight: 13.397, height: 4.799, age: 5.677, baseKcal: 88.362),
        "Female": GenderCalc(weight: 9.247, height: 3.098, age: 4.330, baseKcal: 447.593)
    ]
    
    let activityModifiers: [String: Double] = [
        "Sedentary": 1.2,
        "Lightly active": 1.375,
        "Moderately active": 1.55,
        "Active": 1.725,
        "Very active": 1.9
    ]
    
    let weightLossModifiers: [String: Double] = [
        "-0,25kg/week": 85,
        "-0,50kg/week": 69
    ]
    
    func kcalCalculator(gender: String, activity: String) {
        if textFieldisValid() {
            var baseKcal = 0.0
            var calcVars: GenderCalc = calculationVariables[gender]!
            
            let w = (calcVars.weight * (Double(weight) ?? 0.0))
            let h = (calcVars.height * (Double(height) ?? 0.0))
            let a = (calcVars.age * (Double(age) ?? 0.0))
            baseKcal = ((calcVars.baseKcal  + w + h) - a)
            
            var activityKcal =  baseKcal * activityModifiers[activity]!
            
            var weightLossKcal = 0.0
            
            if let weightlossModifier = weightLossModifiers[weightLoss] {
                weightLossKcal = (weightlossModifier * activityKcal)/100
            } else {
                weightLossKcal = activityKcal
            }
            
            userDailyCal = String(format: "%.0f", weightLossKcal)
            //        vm.addKcal(kcal: vm.userDailyCal)
        }
    }
    
    func textFieldisValid() -> Bool {
        if(age.count < 2 || weight.count < 2 || height.count < 3){
            return false
        }
        return true
    }
    func directKcalTextFieldValidation() -> Bool {
        if(userTargetKcal.count < 3) {
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
                    .foregroundColor(.primary)
            }
        }
    }
    private var TextFieldInputsCalcButton:some View {
        VStack{
            
            TextField("Age",text: $age)
                .padding(.horizontal)
                .foregroundColor(.primary)
                .frame(height:45)
                .background(Color.secondary.opacity( 0.6))
                .cornerRadius(10)
                .font(.title)
                .keyboardType(.decimalPad)
            
            TextField("Height",text: $height)
                .padding(.horizontal)
                .frame(height:45)
                .background(Color.secondary.opacity( 0.6))
                .cornerRadius(10)
                .font(.title)
                .keyboardType(.decimalPad)
                .foregroundColor(Color.primary)
            
            TextField("Weight",text: $weight)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(height:45)
                .background(Color.secondary.opacity( 0.6))
                .cornerRadius(10)
                .font(.title)
                .foregroundColor(.primary)
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
            .foregroundColor(.primary)
            .padding()
            
            InfoButton
            HStack {
                Text("Choose your activity :")
                    .font(.headline)
                    .foregroundColor(.primary)
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
            
            HStack {
                Text("Pick weigh tloss option:")
                    .font(.headline)
                    .foregroundColor(.primary)
                Picker(
                    selection:$weightLoss,
                    label:Text("Weight Loss"),
                    content:{
                        ForEach(weightLossSelection.indices,id:\.self){ index in
                            Text(weightLossSelection[index])
                                .tag(weightLossSelection[index])
                            
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
                .foregroundColor(.primary)
                .background(Color.secondary.opacity(0.6))
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
