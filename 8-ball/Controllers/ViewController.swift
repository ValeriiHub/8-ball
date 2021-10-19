//
//  ViewController.swift
//  8-ball
//
//  Created by Valerii Dulia on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var askButton: UIButton!
    
    let networking = Networking.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        askButton.layer.cornerRadius = 15
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        networking.fetchAnswer { answer in
            
            DispatchQueue.main.async {
                self.answerLabel.text = answer.magic.answer
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            networking.fetchAnswer { answer in
                
                DispatchQueue.main.async {
                    self.answerLabel.text = answer.magic.answer
                }
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let vc = segue.source as? SettingViewController else { return }
        answerLabel.text = vc.answerTextField.text
    }
    
}

