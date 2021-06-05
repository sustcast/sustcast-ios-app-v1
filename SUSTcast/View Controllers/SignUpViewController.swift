//
//  SignUpViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/5/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var department: UIPickerView!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    
    @IBOutlet weak var signUP: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Helper.RoundButton(signUP)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signupFunc(_ sender: Any) {
    }
}
