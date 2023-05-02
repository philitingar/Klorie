//
//  PieSliceView.swift
//  Klorie
//
//  Created by Timea Bartha on 2/5/23.
//

import SwiftUI

@available(OSX 10.15, *)
struct PieSlice: View {
    var pieSliceData: PieSliceData
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                   
                    
                    path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5), radius: width * 0.5, startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle, endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle, clockwise: false)
                    
                }
                .stroke(style:StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
                .fill(pieSliceData.color)
               
                Text(pieSliceData.text)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 1.0 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 1.0 * sin(self.midRadians))
                    )
                    .font(.title)
                    .foregroundColor(.primary)
                    .bold()
                    
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

@available(OSX 10.15, *)
struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var text: String
    var color: Color
}

@available(OSX 10.15.0, *)
struct PieSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieSlice(pieSliceData: PieSliceData(startAngle: Angle(degrees: 0.5), endAngle: Angle(degrees: 120.0), text: "30%", color: Color.black))
    }
}
