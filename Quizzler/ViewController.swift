//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let allQuestions        = QuestionBank()
    var questionNumber: Int = 0
    var score: Int          = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allQuestions.shuffleQuestions()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        func evaluateButtonPress() -> Bool {
            switch sender.tag {
                case 1:  return true
                default: return false
            }
        }
        checkAnswer(selectedAnswer: evaluateButtonPress())
        nextQuestion()
    }
    
    private func updateUI() {
        scoreLabel.text              = "Score: \(score)"
        progressLabel.text           = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(13)) * CGFloat(questionNumber + 1)
    }
    
    private func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.getQuestionText(index: questionNumber)
            updateUI()
        } else {
            showRestartDialog()
        }
    }
    
    private func checkAnswer(selectedAnswer: Bool) {
        let correct = selectedAnswer == allQuestions.getQuestionAnswer(index: questionNumber)
        if correct {
            score += 1
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Wrong")
        }
        questionNumber += 1
    }
    
    private func startOver() {
        questionNumber = 0
        score          = 0
        allQuestions.shuffleQuestions()
        nextQuestion()
    }
    
    private func showRestartDialog() {
        let alert         = UIAlertController(title: "You have finished the quiz", message: "Would you like to restart?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver() })
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
}
