//
//  TrafficLightsLoopView.swift
//  TrafficLightsLoop
//
//  Created by Snow Lukin on 16.02.2022.
//

import SwiftUI

enum LightState {
    case red
    case yellow
    case green
    case none
}

struct TrafficLightsLoopView: View {
    
    @State var onLight: LightState = .none
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                lightsStack
                Spacer()
                switchColorButton
                restartButton
                Spacer()
            }
        }
    }
}

struct TrafficLightsLoopView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightsLoopView()
            .previewDevice("iPhone 8")
    }
}

extension TrafficLightsLoopView {
    
    private var lightsStack: some View {
        VStack {
            LightCircleView(color: .red,
                            opacity: onLight == .red ? 1 : 0.4)
            LightCircleView(color: .yellow,
                            opacity: onLight == .yellow ? 1 : 0.4)
            LightCircleView(color: .green,
                            opacity: onLight == .green ? 1 : 0.4)
        }
        .padding()
    }
    
    private var switchColorButton: some View {
        Button {
            switchLightState()
        } label: {
            let text = onLight == .none ? "Start" : "Next"
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 5)
                )
        }
        .background(.blue)
        .cornerRadius(12)
        .padding(.leading, 50)
        .padding(.trailing, 50)
    }
    
    private var restartButton: some View {
        Button {
            onLight = .none
        } label: {
            Text("Restart")
                .foregroundColor(.red)
                .padding()
        }
    }
    
    private func switchLightState() {
        switch onLight {
        case .red:
            onLight = .yellow
        case .yellow:
            onLight = .green
        default:
            onLight = .red
        }
    }
}
