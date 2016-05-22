//
//  ViewController.swift
//  Project2
//
//  Created by Brandon Sladek on 5/19/16.
//  Copyright © 2016 Brandon Sladek. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerVerificationLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        answerVerificationLabel.text = ""
        scoreLabel.text = "Score: 0"
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
        title = countries[correctAnswer].uppercaseString
    }
    
    // MARK: - Actions

    @IBAction func buttonTapped(sender: UIButton) {
        
        if sender.tag == correctAnswer {
            answerVerificationLabel.text = "Correct!"
            score += 1
        } else {
            answerVerificationLabel.text = "Wrong!"
            score -= 1
        }
        
        scoreLabel.text = "Score: \(score)"
        
        askQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
