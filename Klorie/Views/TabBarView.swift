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
      // UITabBar.appearance().isHidden = true
       // UITabBar.appearance().isTranslucent = false
       // UITabBar.appearance().barTintColor = UIColor.red
   }
    
    @Namespace var animation
    
    private var fillImage: String {
        tabData.cuurentTab + ".fill"
    }
    
    var body: some View {
        TabView(selection: $tabData.cuurentTab){
            HomeView()
                .tag("Home")
            
            DiaryView()
                .tag("Diary")
            
            CalculatorView()
                .tag("Calculator")
        }
        .overlay(
            HStack{
                TabBarButton(title: "Home", image: "house.fill", animation: animation)
                TabBarButton(title: "Diary", image: "book.fill", animation: animation)
                TabBarButton(title: "Calculator", image: "person.fill", animation: animation)
            }
                .environmentObject(tabData)
                .padding(.vertical, 10)
                .background(.thinMaterial,in: Capsule())
                .padding(.horizontal,40)
                .padding(.bottom,2),alignment: .bottom
                
        )
        .foregroundColor(.secondary)
        .navigationBarHidden(true)//this was added extra in order to tru hide tabbar in some view
        
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
            .scaleEffect(tabData.cuurentTab == title ?  1.20 : 1.0)
            .foregroundColor(tabData.cuurentTab == title ? .secondary
                             : .primary)
            .frame(maxWidth: .infinity)
        }
    }
}

