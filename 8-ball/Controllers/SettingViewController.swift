//
//  SettingViewController.swift
//  8-ball
//
//  Created by Valerii Dulia on 19.10.2021.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerTextField.delegate = self
        
        sliderView.layer.cornerRadius = 2.5
    }
}

extension SettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
