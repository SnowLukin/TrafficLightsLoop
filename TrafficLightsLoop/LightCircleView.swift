//
//  LightCircleView.swift
//  TrafficLightsLoop
//
//  Created by Snow Lukin on 16.02.2022.
//

import SwiftUI

struct LightCircleView: View {
    
    var color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color.opacity(opacity))
            .frame(maxWidth: .infinity)

            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .padding(.leading, 50)
            .padding(.trailing, 50)
    }
}

struct LightCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            LightCircleView(color: .red, opacity: 1)
        }
        .previewDevice("iPhone 13 Pro")
    }
    
}
