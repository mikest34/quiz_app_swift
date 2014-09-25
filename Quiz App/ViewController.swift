//
//  ViewController.swift
//  Quiz App
//
//  Created by Michael Stumhofer on 9/25/14.
//  Copyright (c) 2014 Momo Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance Variables
    var QuestionData = QuestionModel()
    var numberOfLives = 3
    var numberOfPoints = 0
    var currentQuestion = 0
    var gameOver = false
    
    // UI Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberOfLivesLeft: UILabel!
    @IBOutlet weak var currentNumberOfPoints: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!

    @IBOutlet weak var nextQuestionButton: UIButton!
    
    
    @IBAction func answerOneButtonPressed(sender: UIButton) {
        NSLog("button one pressed")
        answerQuestion(QuestionData.questions[currentQuestion], answer: 0)
    }
    @IBAction func answerTwoButtonPressed(sender: UIButton) {
        NSLog("button two pressed")
        answerQuestion(QuestionData.questions[currentQuestion], answer: 1)
    }
    
    @IBAction func answerThreeButtonPressed(sender: UIButton) {
        NSLog("button three pressed")
        answerQuestion(QuestionData.questions[currentQuestion], answer: 2)
    }
    
    @IBAction func answerFourButtonPressed(sender: UIButton) {
        NSLog("button four pressed")
        answerQuestion(QuestionData.questions[currentQuestion], answer: 3)
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        nextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        numberOfLivesLeft.text = "\(numberOfLives)"
        currentNumberOfPoints.text = "\(numberOfPoints)"
        startUpQuestion(QuestionData.questions[currentQuestion])
        questionLabel.numberOfLines = 0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startUpQuestion(questionObj:Question) {
        
        questionLabel.text = "\(questionObj.question)"
        
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton]
        var i = 0
        
        for i in 0..<answerButtons.count {
            // set the question
            answerButtons[i].setTitle("\(questionObj.answers[i])", forState: UIControlState.Normal)
            // make sure it is visible and enabled
            answerButtons[i].hidden = false
            answerButtons[i].enabled = true
            // change the color back to the default
            answerButtons[i].setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        
        nextQuestionButton.hidden = true
        
    }
    
    func answerQuestion(questionObj:Question, answer: Int) {
        
        
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton]
        var i = 0
        
        for i in 0..<answerButtons.count {
            answerButtons[i].enabled = false
            if i == questionObj.correctAnswerIndex {
                // color correct answer green
                answerButtons[i].setTitleColor(UIColor.greenColor(), forState: .Normal)
            } else if i != questionObj.correctAnswerIndex {
                // color wrong answer red
                answerButtons[i].setTitleColor(UIColor.redColor(), forState: .Normal)
            }
        }
        
        if (questionObj.correctAnswerIndex == answer) {
            addPoints(1)
        } else {
            reduceLives()
        }
        
        nextQuestionButton.hidden = false

        
    }
    
    func nextQuestion() {
        
        currentQuestion++
        
        if (QuestionData.questions.count == currentQuestion) {
            
            endGame()
            
        } else if !gameOver {
        
            startUpQuestion(QuestionData.questions[currentQuestion])
            
        }
        
    }
    
    func reduceLives () {
        
        numberOfLives -= 1
        numberOfLivesLeft.text = "\(numberOfLives)"
        
        if numberOfLives == 0 {
            endGame()
        }
        
    }
    
    func addPoints(points:Int) {
        
        numberOfPoints += points
        currentNumberOfPoints.text = "\(numberOfPoints)"
        
    }
    
    func endGame() {
        
        gameOver = true
        var gameOverText = "Game Over"
        
        if numberOfPoints == QuestionData.questions.count {
            gameOverText += "\nPerfect Score!\nNice Job!"
        } else if numberOfPoints >= (QuestionData.questions.count-2) {
            gameOverText += "\nPretty good score."
        } else {
            gameOverText += "\nYou should have paid more attention in history class."
        }
        
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton]
        var i = 0
        
        for i in 0..<answerButtons.count {
            answerButtons[i].hidden = true
        }
        
        questionLabel.text = gameOverText
        
        nextQuestionButton.hidden = true
        
    }
    


}

