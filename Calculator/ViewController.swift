import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
//MARK: - Buttons
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
            
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
            
        if let numValue = sender.currentTitle {
            
            switch (displayLabel.text) {
            case "0":
                displayLabel.text = numValue
            default:
                displayLabel.text = displayLabel.text! + numValue
            }

        }
    }
}

