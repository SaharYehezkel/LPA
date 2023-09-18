//
//  Words.swift
//  Test-App
//
//  Created by Sahar Yehezkel on 16/09/2023.
//

import Foundation

class Word {
    
    // properties:
    var wordEN: String
    var wordHE: String
    var dateAdd: Date
    
    init(wordEN: String, wordHE: String, dateAdd: Date) {
        self.wordEN = wordEN
        self.wordHE = wordHE
        self.dateAdd = dateAdd
    }
}
