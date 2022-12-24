//
//  ViewController.swift
//  Project-2
//
//  Created by Đức Anh Trần on 23/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var countries = [String]()
    var scoreNumber = 0
    var corectAnswer = 0
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction? = nil) {
        countries.shuffle()
        
        corectAnswer = Int.random(in: 0...2)
        title = countries[corectAnswer].uppercased()
        
        questionNumber += 1
        questionLabel.text = "Question: \(questionNumber)"
        
        button1.setImage(UIImage(named: countries[0]), for: UIControl.State.normal)
        button2.setImage(UIImage(named: countries[1]), for: UIControl.State.normal)
        button3.setImage(UIImage(named: countries[2]), for: UIControl.State.normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == corectAnswer {
            scoreNumber += 1
            title = "Correct"
            message = "Good jobs, amazing!"
        } else {
            scoreNumber -= scoreNumber == 0 ? 0 : 1
            title = "Wrong"
            message = "That's the flag of \(countries[sender.tag])"
        }
        scoreLabel.text = "Score: \(scoreNumber)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let finalAlert = UIAlertController(title: "Game Over", message: "Total score: \(scoreNumber)", preferredStyle: .alert)
        
        if questionNumber < 10 {
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alert, animated: true)
        } else {
            finalAlert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { _ in
                self.scoreNumber = 0
                self.scoreLabel.text = "Score: 0"
                self.corectAnswer = 0
                self.questionNumber = 0
                self.askQuestion()
            }))
            present(finalAlert, animated: true)
        }
    }

}



