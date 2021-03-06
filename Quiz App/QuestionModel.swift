//
//  QuestionModel.swift
//  Quiz App
//
//  Created by Michael Stumhofer on 9/25/14.
//  Copyright (c) 2014 Momo Studios. All rights reserved.
//

import Foundation


class QuestionModel {
    
    var questions: Array<Question>
    
    init () {

        questions = []
        questions.append(Question(question: "What year did WWII start?", answers:["1939", "1940", "1941", "1942"], correctAnswerIndex: 0))
        questions.append(Question(question: "What day was D-Day?", answers:["June 6, 1944", "June 16, 1944", "June 26, 1944", "June 16, 1943"], correctAnswerIndex: 0))
        questions.append(Question(question: "What country was first invaded by Germany?", answers:["France", "Belgium", "Poland", "Russia"], correctAnswerIndex: 2))
        questions.append(Question(question:"Which article of the Weimar Constitution granted Hitler emergency powers essentially allowing him to avoid parliament? ", answers:["Article 26", "Article 86", "Article 3", "Article 48"], correctAnswerIndex: 3))
        questions.append(Question(question:"Who was the leader of the Soviet Union during World War II?", answers:["Lenin", "Trotsky", "Stalin",  "Khruschev"], correctAnswerIndex: 2))
        questions.append(Question(question:"The main Axis powers of WWII Consisted of: Germany, _____, _____", answers:["Italy, Japan", "Russia, Japan", "Romania, Russia", "Japan, Romania"], correctAnswerIndex: 0))
        
    }
    

    
}

class Question {
    var question: String
    var answers: Array<String>
    var correctAnswerIndex: Int
    
    init(question: String,answers:Array<String>,correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func isGuessCorrect(guessNumber: Int) -> Bool {
        
        return correctAnswerIndex == Int(guessNumber-1)
        
    }
    
}