//
//  AdditionViewController.swift
//  Arithmica
//
//  Created by StudentAM on 5/11/23.
//

import UIKit

class AdditionViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultSymbol: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initializeHideKeyboard()
        helpButton.isHidden = true
        resultLabel.isHidden = true
        resultSymbol.isHidden = true
        generateNewProblem()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    var firstInt = Int.random(in: 0..<11)
    var secondInt = Int.random(in: 0..<11)
        
    func generateNewProblem() {
        firstInt = Int.random(in: 0..<11)
        secondInt = Int.random(in: 0..<11)
        
        firstNumberLabel.text = "\(firstInt)"
        secondNumberLabel.text = "\(secondInt)"
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let correctAnswer = firstInt + secondInt
        
        let textFieldInt: Int? = Int(inputTextField.text!)
        
        resultLabel.isHidden = false
        resultSymbol.isHidden = false
        
        if textFieldInt == correctAnswer {
            helpButton.isHidden = true
            resultSymbol.image = UIImage(named: "greencheckmark")
            resultLabel.text = correctMessages.randomElement()
            generateNewProblem()
        } else {
            helpButton.isHidden = false
            resultSymbol.image = UIImage(named: "redX")
            resultLabel.text = incorrectMessages.randomElement()
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
        let helpAnswer = firstInt + secondInt
        resultLabel.text = "\(firstInt) + \(secondInt) = \(helpAnswer)"
    }
    
}
