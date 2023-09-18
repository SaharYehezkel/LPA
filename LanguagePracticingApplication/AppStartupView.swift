//
//  ContentView.swift
//  Test-App
//
//  Created by Sahar Yehezkel on 16/09/2023.
//

import SwiftUI

struct AppStartupView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.3
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "brain")
                        .padding()
                        .font(.system(size:180))
                        .foregroundColor(.pink)
                    Text("Sahar Yehezkel")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color.pink)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct AppStartupView_Previews: PreviewProvider {
    static var previews: some View {
        AppStartupView()
    }
}

