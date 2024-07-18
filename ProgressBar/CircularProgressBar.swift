//
//  CircularProgressBar.swift
//  ProgressBar
//
//  Created by Etisha Garg on 18/07/24.
//

import SwiftUI

struct CircularProgressBar: View {
    
    @State private var moveProgress: CGFloat = 0.0
    @State private var exerciseProgress: CGFloat = 0.0
    @State private var standProgress: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                ActivityProgressView(color: Color(red: 250 / 255, green: 17 / 255, blue: 79 / 255), progress: moveProgress)
                    .frame(width: 300, height: 300)
                
                ActivityProgressView(color: Color(red: 166 / 255, green: 255 / 255, blue: 0 / 255), progress: exerciseProgress)
                    .frame(width: 200, height: 200)
                
                ActivityProgressView(color: Color(red: 0 / 255, green: 255 / 255, blue: 246 / 255), progress: standProgress)
                    .frame(width: 100, height: 100)
            }
            
            VStack(spacing: 10) {
                SliderView(progress: $moveProgress, title: "Move Progress")
                SliderView(progress: $exerciseProgress, title: "Exercise Progress")
                SliderView(progress: $standProgress, title: "Stand Progress")
            }
            .padding()
            
            Button("Reset all"){
                moveProgress = 0.0
                exerciseProgress = 0.0
                standProgress = 0.0
            }
        }
    }
}

struct ActivityProgressView: View {
    let color: Color
    let progress: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 40)
                .opacity(0.1)
                .foregroundStyle(color)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .foregroundStyle(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}

struct SliderView: View {
    @Binding var progress: CGFloat
    let title: String
    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Slider(value: $progress, in: 0...1.0, minimumValueLabel: Text("0"), maximumValueLabel: Text("100%")) {}
            
        }
    }
}

#Preview {
    CircularProgressBar()
}
