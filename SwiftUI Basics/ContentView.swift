//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Manyuchi, Carrington C on 2024/11/25.
//

import SwiftUI

struct ContentView: View {
    
    let colorList1: [Color] = [.red, .purple, .green, .pink,]
    let colorList2: [Color] = [.black, .white, .blue]
    @State private var screenTapped: Bool = false
    @State private var offsetY: CGFloat = -100.0
    
    // Computed property
    var colors: [Color] {
        screenTapped ? colorList1 : colorList2
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Text("SwiftUI Basics")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .offset(y: offsetY)
            }
            .padding()
            
        }
        .onTapGesture {
            // TODO: Change screen color if tapped
            self.screenTapped.toggle()
            withAnimation(.easeIn(duration: 0.6)) {
                offsetY = screenTapped ? 300 : -300.0
            }
            
        }
    }
}

#Preview {
    ContentView()
}
