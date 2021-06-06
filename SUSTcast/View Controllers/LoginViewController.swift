//
//  LoginViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/5/21.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var forgotPass: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     @IBAction func login(_ sender: Any) {
        
        
        let mail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: mail, password: pass) { (result, error) in
            
            if error != nil {
                // Error
            } else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardId.homeViewController) as? HomeViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
            
        }
        
        
     }
     

}
