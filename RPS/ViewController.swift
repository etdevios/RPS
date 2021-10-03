//
//  ViewController.swift
//  RPS
//
//  Created by Eduard Tokarev on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusOfTheGame: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorSign: UIButton!
    @IBOutlet weak var appView: UIImageView!
    @IBOutlet weak var playAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTheUI( .start)
    }
    @IBAction func rockButton(_ sender: Any) {
        updateTheUI(play(.rock))
    }
    @IBAction func paperButton(_ sender: Any) {
        updateTheUI(play(.paper))
    }
    @IBAction func scissorButton(_ sender: Any) {
        updateTheUI(play(.scissors))
    }
    @IBAction func playAgainButton(_ sender: Any) {
        updateTheUI(.start)
    }
    
    
    
    
    
    func updateTheUI(_ status: GameState){
        switch status {
        case .start:
            statusOfTheGame.text = "Rock, Paper, Scissor?"
            self.view.backgroundColor = UIColor.white
            appSign.isHidden = true
            appView.isHidden = false
            playAgain.isHidden = true
            rockSign.isHidden = false
            rockSign.isEnabled = true
            paperSign.isHidden = false
            paperSign.isEnabled = true
            scissorSign.isHidden = false
            scissorSign.isEnabled = true
            
        case .draw:
            appView.isHidden = true
            appSign.isHidden = false
            statusOfTheGame.text = "It's a draw."
            self.view.backgroundColor = UIColor.gray
        case .lose:
            appView.isHidden = true
            appSign.isHidden = false
            statusOfTheGame.text = "Sorry, you lose."
            self.view.backgroundColor = UIColor.systemTeal
        case .win:
            appView.isHidden = true
            appSign.isHidden = false
            statusOfTheGame.text = "You Win!"
            self.view.backgroundColor = UIColor.orange
            
        }
    }
    func play(_ playerTurn: Sign) -> GameState {
        let opponent = randomSign()
        appSign.text = opponent.emoji
        let result = playerTurn.takeTurn(opponent)
        switch playerTurn {
        case .paper:
            rockSign.isHidden = true
            scissorSign.isHidden = true
            paperSign.isEnabled = false
        case .rock:
            paperSign.isHidden = true
            scissorSign.isHidden = true
            rockSign.isEnabled = false
        case .scissors:
            rockSign.isHidden = true
            paperSign.isHidden = true
            scissorSign.isEnabled = false
        }
        playAgain.isHidden = false
        return result
    }
}

