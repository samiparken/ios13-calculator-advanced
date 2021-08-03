import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel.text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
//MARK: - Buttons
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayValue = 0
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
            
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayValue = Double(numValue)!
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if isInt { return }
                } else {
                    displayLabel.text = displayLabel.text! + numValue

                }
            }
        }
    }
}

