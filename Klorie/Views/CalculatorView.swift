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
    
    @EnvironmentObject var vm : MealViewModel
    
    
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
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(height:55)
                                    .frame(maxWidth:120)
                                    .background(textFieldisValid() ?
                                                Color(red: 175/255, green: 101/255, blue: 181/255) : Color.gray)
                                    .cornerRadius(10)
                                    .padding()
                                
                                
                            }
                            .disabled(!textFieldisValid())
                            .alert("Recommended daily calories:", isPresented: $showAlert, actions: {
                                
                            }, message: {
                                Text("\(vm.userDailyCal) kcal")
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
                .sheet(isPresented: $showInfoSheet) {
                    InfoSheetView()
                }
        }
    }
    
    func kcalCalculator(gender:String,activity:String) {
        if textFieldisValid() {
            var res = 0.0
            if gender == "Male"{
                let w = (13.75 * (Double(weight) ?? 0.0))
                let h = (5.003 * (Double(height) ?? 0.0))
                let a = (6.755 * (Double(age) ?? 0.0))
                let total = ((66.47  + w + h) - a)
                
                switch(activity) {
                case "Sedentary":
                    res = total * 1.2
                    break
                case "Lightly active":
                    res = total * 1.375
                    break
                case "Moderately active":
                    res = total * 1.55
                    break
                case "Active":
                    res = total * 1.725
                    break
                default:
                    // "Very active"
                    res = total * 1.9
                }
                vm.userDailyCal =
                String(format: "%.0f", res)
                vm.addKcal(kcal: vm.userDailyCal)
            } else {
                let w = (9.563 * (Double(weight) ?? 0.0))
                let h = (1.850 * (Double(height) ?? 0.0))
                let a = (4.676 * (Double(age) ?? 0.0))
                let total = ((655.1 + w + h) - a)
                
                switch(activity){
                case "Sedentary":
                    res = total * 1.2
                    break
                case "Lightly active":
                    res = total * 1.375
                    break
                case "Moderately active":
                    res = total * 1.55
                    break
                case "Active":
                    res = total * 1.725
                    break
                default:
                    // "Very active"
                    res = total * 1.9
                }
                
                vm.userDailyCal = String(format: "%.0f", res)
                vm.addKcal(kcal: vm.userDailyCal)
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
            .environmentObject(MealViewModel())
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