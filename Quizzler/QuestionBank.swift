//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Chris J W Walker on 06/07/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() {
        list.append(Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true))
        list.append(Question(text: "A slug\'s blood is green.", correctAnswer: true))
        list.append(Question(text: "Approximately one quarter of human bones are in the feet.", correctAnswer: true))
        list.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true))
        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))
        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
        list.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
    }
    
    func getQuestionText(index: Int) -> String {
        return list[index].text
    }
    
    func getQuestionAnswer(index: Int) -> Bool {
        return list[index].correctAnswer
    }
    
    func shuffleQuestions() {
        list = shuffle(count: (list.count - 1), questions: list)
    }
    
    private func shuffle(count: Int, questions: [Question]) -> [Question] {
        var shufflingList = questions
        if count > 0 {
            let rand = Int(arc4random_uniform(UInt32(count)))
            shufflingList.swapAt(count, rand)
            return shuffle(count: (count - 1), questions: shufflingList)
        } else {
            return shufflingList
        }
    }
}
