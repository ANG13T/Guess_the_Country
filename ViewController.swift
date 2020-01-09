//
//  ViewController.swift
//  Guess_The_Flag
//
//  Created by Angelina Tsuboi on 1/7/20.
//  Copyright © 2020 Angelina Tsuboi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var flag1: UIButton!
    @IBOutlet var flag2: UIButton!
    @IBOutlet var flag3: UIButton!
    
    var countries = [String]()
    var points = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flag1.layer.borderWidth = 1 //sets witdth of border
        flag2.layer.borderWidth = 1 //sets witdth of border
        flag3.layer.borderWidth = 1 //sets witdth of border
        
        flag1.layer.borderColor = UIColor.lightGray.cgColor; //using cgColor because it is on a CG layer
        flag2.layer.borderColor = UIColor.lightGray.cgColor;
        flag3.layer.borderColor = UIColor.lightGray.cgColor;
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "   Score: \(points)"
    }
    
    
    @IBAction func flagPressed(_ sender: UIButton) {
        var title:String
        var message:String
             
             if sender.tag == correctAnswer {
                 title = "Correct"
                message = "Awesome! Your score is \(points)"
                 points += 1
             } else{
                 title = "Wrong"
                message = "That's the flag of \(countries[sender.tag])"
                 points -= 1
             }
             
             let ac = UIAlertController(title: title, message: "Your score is \(points)", preferredStyle:.alert)
             ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
             present(ac, animated: true)
            questionsAsked += 1
        
        if(questionsAsked == 10){
            let completeAlert = UIAlertController(title: "You have completed the game!", message: "Your score was \(points)", preferredStyle: .alert)
            present(completeAlert, animated: true)
        }
    }
    
}

