//
//  AllWordsView.swift
//  Test-App
//
//  Created by Sahar Yehezkel on 16/09/2023.
//

import SwiftUI

struct AllWordsView: View {
    @Binding var words: [Word]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            Image("bg-wp")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Remaining Words")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 50.0)
                
                Form {
                    Section(header: Text("Remaining Words")) {
                        ForEach(words, id: \.wordEN) { word in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("English: \(word.wordEN)")
                                    Text("Hebrew: \(word.wordHE)")
                                    Text("Date Added: \(formatDate(word.dateAdd))")
                                }
                                Spacer()
                                Button(action: {
                                    deleteWord(word)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                }

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
                
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func deleteWord(_ word: Word) {
        if let index = words.firstIndex(where: { $0.wordEN == word.wordEN }) {
            words.remove(at: index)
        }
    }
}

struct Previews_AllWordsView_Previews: PreviewProvider {
    static var previews: some View {
        AllWordsView(words: .constant([]))
    }
}
