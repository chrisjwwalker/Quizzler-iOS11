//
//  Question.swift
//  Quizzler
//
//  Created by Chris J W Walker on 06/07/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer       = correctAnswer
    }
}
