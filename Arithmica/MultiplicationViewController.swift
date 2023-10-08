//
//  MultiplicationViewController.swift
//  Arithmica
//
//  Created by StudentAM on 5/11/23.
//

import UIKit

class MultiplicationViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!
    
    @IBOutlet weak var resultSymbol: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    @IBOutlet weak var inputTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initializeHideKeyboard()
        helpButton.isHidden = true
        resultSymbol.isHidden = true
        resultLabel.isHidden = true
        generateNewProblem()
    }
    
    var firstInt = Int.random(in: 0..<13)
    var secondInt = Int.random(in: 0..<13)
    
    func generateNewProblem() {
        firstInt = Int.random(in: 0..<13)
        secondInt = Int.random(in: 0..<13)
        
        firstNumberLabel.text = "\(firstInt)"
        secondNumberLabel.text = "\(secondInt)"
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let correctAnswer = firstInt * secondInt
        
        let textFieldInt: Int? = Int(inputTextLabel.text!)
        
        resultLabel.isHidden = false
        resultSymbol.isHidden = false
        
        
        if textFieldInt == correctAnswer {
            helpButton.isHidden = true
            resultLabel.text = correctMessages.randomElement()
            resultSymbol.image = UIImage(named: "greencheckmark")
            generateNewProblem()
        } else {
            helpButton.isHidden = false
            resultLabel.text = incorrectMessages.randomElement()
            resultSymbol.image = UIImage(named: "redX")
        }
        
        inputTextLabel.text = ""
        
    }
    
    
    // hide number pad when tapping away
    
        func initializeHideKeyboard() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(closeKeyboard))
            view.addGestureRecognizer(tap)
        }
        
        @objc func closeKeyboard() {
            view.endEditing(true)
        }
    
    // prevent text field from growing bigger than the view
    
    @IBAction func isEditingTextField(_ sender: UITextField) {
        if let text = sender.text, text.count >= 5 {
            sender.text = String(text.dropLast(text.count - 5))
            return
        }
    }
    
    // reveal answer if player needs help
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        let helpAnswer = firstInt * secondInt
        resultLabel.text = "\(firstInt) x \(secondInt) = \(helpAnswer)"
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
