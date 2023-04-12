//
//  BackgroundView.swift
//  Klorie
//
//  Created by Timea Bartha on 5/4/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color(red: 41/255, green: 62/255, blue: 87/255)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
