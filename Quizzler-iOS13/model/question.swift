//
//  question.swift
//  Quizzler-iOS13
//
//  Created by user197822 on 5/20/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let question : String
    let answer  : [String]
    let correctAnswer : String
    
    init(q:String, a:[String], correctAnswer : String){
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
