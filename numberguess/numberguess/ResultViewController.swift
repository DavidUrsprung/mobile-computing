//
//  ResultViewController.swift
//  numberguess
//
//  Created by Ursprung David on 16.11.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var labelGratulation: UILabel!
    
    @IBOutlet weak var emoji: UIImageView!
    
    var gamelogik:GameLogik?
    
    override func viewDidLoad() {
        emoji.isHidden = false
        labelGratulation.text = "Gratuliere! Sie haben \(gamelogik?.numberOfGuesses) Versuche gebraucht."
        super.viewDidLoad()
    }
}
