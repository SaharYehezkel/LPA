//
//  AddNewWordView.swift
//  Test-App
//
//  Created by Sahar Yehezkel on 16/09/2023.
//

import SwiftUI

struct AddNewWordView: View {
    @State private var wordEnglish: String = ""
    @State private var wordHebrew: String = ""
    @Binding var words: [Word]
    @State private var addStatus: String = ""
    @State private var statusColor = Color.green
    @Environment(\.presentationMode) var presentationMode
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func addButton() -> Void {
        if isValidInput(wordEnglish, language: .english) && isValidInput(wordHebrew, language: .hebrew) {
            let currentDate = Date()
            let newWord = Word(wordEN: wordEnglish, wordHE: wordHebrew, dateAdd: currentDate)
            if words.contains(where: { $0.wordEN == wordEnglish }) {
                addStatus = "Word already exists!"
                statusColor = Color.yellow
                return
            }
            words.append(newWord)
            addStatus = "New word add successfully!"
            statusColor = Color.green
            wordEnglish = ""
            wordHebrew = ""
            return
        } else {
            addStatus = "Invalid input!"
            statusColor = Color.red
            return 
        }
    }
    
    enum Language {
        case english
        case hebrew
    }
    
    func isValidInput(_ text: String, language: Language) -> Bool {
        let pattern: String
        
        switch language {
        case .english:
            pattern = "^[a-zA-Z ]+$" // Allow English letters and spaces
        case .hebrew:
            pattern = "^[א-ת ]+$"  // Allow Hebrew letters and spaces
        }
        
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: text)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg-wp")
                    .resizable()
                    .ignoresSafeArea()
                VStack() {
                    Text("Add New Word")
                        .font(.system(size: 45))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, -50.0)
                        
                    Text(addStatus)
                        .font(.system(size: 18))
                        .font(.title)
                        .foregroundColor(statusColor)
                    HStack {
                        Spacer(minLength: 50)
                        TextField("English Word", text: $wordEnglish)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(
                                RoundedRectangle(cornerRadius: 10))
                        Spacer(minLength: 50)
                    }
                    HStack {
                        Spacer(minLength: 50)
                        TextField("Hebrew Translation", text: $wordHebrew)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(
                                RoundedRectangle(cornerRadius: 10))
                        Spacer(minLength: 50)
                    }
                    HStack {
                        Spacer()
                        Spacer()
                        Button {
                            addButton()
                        } label: {
                            ZStack{
                                Image("button2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 130)
                                Text("Add")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                        }
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack {
                                
                                Image("button3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 130)
                                Text("Back")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct AddNewWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWordView(words: .constant([]))
    }
}

