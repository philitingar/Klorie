//
//  BackgroundView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [ Color(red: 148/255, green: 0/255, blue: 211/255), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
