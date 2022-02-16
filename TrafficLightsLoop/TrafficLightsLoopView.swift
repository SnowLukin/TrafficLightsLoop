//
//  TrafficLightsLoopView.swift
//  TrafficLightsLoop
//
//  Created by Snow Lukin on 16.02.2022.
//

import SwiftUI

struct TrafficLightsLoopView: View {
    
    enum LightState {
        case red
        case yellow
        case green
        case none
    }
    
    @State var onLight = LightState.none
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                getLight(lightState: .red, color: .red)
                getLight(lightState: .yellow, color: .yellow)
                getLight(lightState: .green, color: .green)
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
            .previewDevice("iPhone 13 Pro")
    }
}

extension TrafficLightsLoopView {
    
    private func getLight(lightState: LightState, color: Color) -> some View {
        LightCircleView(
            color: onLight == lightState
            ? color
            : color.opacity(0.4)
        )
    }
    
    private var switchColorButton: some View {
        Button {
            switch onLight {
            case .red:
                onLight = .yellow
            case .yellow:
                onLight = .green
            default:
                onLight = .red
            }
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
}
