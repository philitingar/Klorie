//
//  TabBarView.swift
//  Klorie
//
//  Created by Timea Bartha on 12/4/23.
//
import SwiftUI

struct TabBarView: View {
    @StateObject var tabData = TabBarViewModel()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    private var fillImage: String {
        tabData.cuurentTab + ".fill"
    }
    
    var body: some View {
        TabView(selection: $tabData.cuurentTab){
            HomeView()
                .tag("Home")
            
            MenuView()
                .tag("Menu")
            
            CalculatorView()
                .tag("Calculator")
        }
        .overlay(
            HStack{
                TabBarButton(title: "Home", image: "house.fill", animation: animation)
                TabBarButton(title: "Menu", image: "carrot.fill", animation: animation)
                TabBarButton(title: "Calculator", image: "person.fill", animation: animation)
            }
                .environmentObject(tabData)
                .padding(.vertical,10)
                .background(Color(red: 175/255, green: 101/255, blue: 181/255).opacity( 0.7))
                .cornerRadius(20.0)
                .padding(.bottom,8)
            ,alignment: .bottom
        )
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            
    }
}

struct TabBarButton: View{
    
    var title:String
    var image:String
    var animation:Namespace.ID
    
    @EnvironmentObject var tabData: TabBarViewModel
    
    var body: some View{
        Button{
            withAnimation{
                tabData.cuurentTab = title
            }
        }label: {
            VStack{
                Image(systemName: image)
                    .font(.title2)
                Text(title)
                    .font(.caption.bold())
            }
            .scaleEffect(tabData.cuurentTab == title ?  1.40 : 1.0)
            .foregroundColor(tabData.cuurentTab == title ? Color(red: 41/255, green: 62/255, blue: 87/255)
                             : .white)
            .frame(maxWidth: .infinity)
        }
    }
}

