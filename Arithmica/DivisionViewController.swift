//
//  DivisionViewController.swift
//  Arithmica
//
//  Created by StudentAM on 5/11/23.
//

import UIKit

class DivisionViewController: UIViewController {
    
    
    @IBOutlet weak var helpButton: UIButton!
    
    @IBOutlet weak var resultSymbol: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initializeHideKeyboard()
        helpButton.isHidden = true
        resultSymbol.isHidden = true
        resultLabel.isHidden = true
        generateNewProblem()
    }
    
    var firstInt =  floor(Double.random(in: 0.0..<145.0))
    var secondInt = floor(Double.random(in: 1.0..<13.0))
    
    func generateNewProblem() {
        
        firstInt = floor(Double.random(in: 0.0..<145.0))
        secondInt = floor(Double.random(in: 1.0..<13.0))
        
        let remainder = firstInt.truncatingRemainder(dividingBy: secondInt)
        let result = Int(firstInt) / Int(secondInt)
        
        guard remainder == 0.0 && (result <= 12) else {
            generateNewProblem()
            return
        }
        
        firstNumberLabel.text = "\(Int(firstInt))"
        secondNumberLabel.text = "\(Int(secondInt))"
        
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let correctAnswer = Int(firstInt) / Int(secondInt)
        
        let textFieldInt: Int? = Int(inputTextField.text!)
        
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
        
        inputTextField.text = ""
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
        let helpAnswer = Int(firstInt) / Int(secondInt)
        resultLabel.text = "\(Int(firstInt)) ÷ \(Int(secondInt)) = \(helpAnswer)"
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
