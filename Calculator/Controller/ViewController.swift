import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var calculator = CalculatorLogic()

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
            calculator.setNumber(displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else { fatalError("Result of the calculation is nil")}
            displayValue = result
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

