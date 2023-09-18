//
//  MainView.swift
//  Test-App
//
//  Created by Sahar Yehezkel on 16/09/2023.
//

import SwiftUI

struct MainView: View {
    @State private var words: [Word] = []
    func addWordButton() {
        
    }
    
    func playButton() {
        
    }
    
    func allRemainingWordsButton() {
        
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("bg-wp")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    
                    Text("Menu Page")
                        .font(.system(size: 45))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 50.0)
                    
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: AddNewWordView(words: $words)) {
                        ZStack {
                            Image("button1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250)
                            Text("Add New Word")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                    .padding(.bottom, -20.0)
                    
                    Button{
                        playButton()
                    }
                label: {
                    ZStack {
                        Image("button2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                        Text("Play")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.bottom, -20.0)
                    
                    NavigationLink(destination:AllWordsView(words: $words)) {
                    ZStack {
                        Image("button3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                        Text("All Remaining Words")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

