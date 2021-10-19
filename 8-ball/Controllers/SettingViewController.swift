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

        sliderView.layer.cornerRadius = 2.5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

