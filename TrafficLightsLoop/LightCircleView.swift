//
//  LightCircleView.swift
//  TrafficLightsLoop
//
//  Created by Snow Lukin on 16.02.2022.
//

import SwiftUI

struct LightCircleView: View {
    
    var color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct LightCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            LightCircleView(color: .red)
        }
        .previewDevice("iPhone 13 Pro")
    }
    
}
