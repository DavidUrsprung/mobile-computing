import UIKit

class ViewController: UIViewController {
    
    var gameLogik = GameLogik()
    
    @IBOutlet weak var texfield: UITextField!
    @IBOutlet weak var message: UILabel!
    //let number = 0
    
    @IBOutlet weak var guessmeButton: UIButton!
    
    @IBOutlet weak var trys: UILabel!
    
    
    @IBAction func editingChanged(_ sender: UITextField) {
    
       /*
        if gameLogik.isvalidguess(string: sender.text){
            guessmeButton.isEnabled = true
        } else {
            guessmeButton.isEnabled = false
        }
        */
        let enabled = gameLogik.isvalidguess(string: sender.text)
        print("Button is enabled \(enabled)")
        guessmeButton.isEnabled = enabled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //guessmeButton.isEnabled = false
        
        gameLogik.startNewGame()
        
        print("erraten: \(gameLogik.numberToGuess)")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return gameLogik.evaluate(string: texfield.text!) == 0;
    }

    @IBAction func ontouchUpInside(_ sender: UIButton) {
        
        var outputText: String!
        
        if let guess = texfield.text {
            message.text = "\(guess)"
            let guessResult = gameLogik.evaluate(string: guess)
 
            switch guessResult {
            case 1:
                outputText = "Zu groß!"
            case -1:
                outputText = "Zu klein!"
            default:
                outputText = "Erraten!"
            }
        }
        
        message.text = outputText
        gameLogik.numberOfGuesses += 1
        trys.text = "Anzahl der Versuche: \(gameLogik.numberOfGuesses)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        
        let resultViewController = segue.destination as? ResultViewController
        resultViewController?.gamelogik = gameLogik
    }
       
}
