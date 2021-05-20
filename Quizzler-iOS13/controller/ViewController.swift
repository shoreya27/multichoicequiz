//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizzz = quiz()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //change question text
        questionLabel.text = quizzz.questions[quizzz.questionNum].question
        firstChoice.setTitle(quizzz.questions[quizzz.questionNum].answer[0], for: .normal)
        secondChoice.setTitle(quizzz.questions[quizzz.questionNum].answer[1], for: .normal)
        thirdChoice.setTitle(quizzz.questions[quizzz.questionNum].answer[2] ,for: .normal)
        scoreLabel.text = "Score: \(quizzz.score)"
        progressView.progress = quizzz.getProgress()
    }
    

    @IBAction func answerButtonHit(_ sender: UIButton) {
        //check answer
        let userAns = sender.currentTitle!
        let userGotRight = quizzz.checkAnswer(userAns)
        
        //on base of user answer change button colour
        if userGotRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //change the question
        quizzz.nextQuestion()
        
        //after delay of 0.2 seconds, change color to clear , change question text, increase progress bar
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){ timer in
            sender.backgroundColor = UIColor.clear
            self.questionLabel.text = self.quizzz.getQuestion()
            self.firstChoice.setTitle(self.quizzz.getFirstAnswer(),for: .normal)
            self.secondChoice.setTitle(self.quizzz.getSecondAnswer(), for: .normal)
            self.thirdChoice.setTitle(self.quizzz.getThirdAnswer(), for: .normal)
            self.scoreLabel.text = "Score: \(self.quizzz.score)"
            self.progressView.progress = self.quizzz.getProgress()
        }

        
    }
    
}

