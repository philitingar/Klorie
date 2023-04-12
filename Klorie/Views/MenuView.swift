//
//  MenuView.swift
//  Klorie
//
//  Created by Timea Bartha on 6/4/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            Text("This is the menu view")
                .foregroundColor(.white)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
