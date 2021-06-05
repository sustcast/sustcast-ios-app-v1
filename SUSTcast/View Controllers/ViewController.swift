//
//  ViewController.swift
//  SUSTcast
//
//  Created by Abrar on 3/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Helper.RoundButton(SignUpButton)
        Helper.RoundButton(LoginButton)

    }


}

