//
//  ViewController.swift
//  SUSTcast
//
//  Created by Abrar on 3/31/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    private var authListener: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
//        if Auth.auth().currentUser != nil {
//            let user = Auth.auth().currentUser
//            print("Im here" + (user?.email)!)
//
//            let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardId.homeViewController) as? HomeViewController
//            self.view.window?.rootViewController = homeViewController
//            self.view.window?.makeKeyAndVisible()
//        } else {
            Helper.RoundButton(self.SignUpButton)
            Helper.RoundButton(self.LoginButton)
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        authListener = Auth.auth().addStateDidChangeListener({ (auth, user) in
        
        
        
        
        
    }
    //        )
    
    
    
    //        print("Test" + Auth.auth().currentUser!.uid)
    //
    //       Auth.auth().addStateDidChangeListener { auth, user in
    //        if((user) != nil){
    //            let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardId.homeViewController) as? HomeViewController
    //            self.view.window?.rootViewController = homeViewController
    //            self.view.window?.makeKeyAndVisible()
    //        }
    //        else {
    //            Helper.RoundButton(self.SignUpButton)
    //            Helper.RoundButton(self.LoginButton)
    //        }
    //            }
    //        if((Auth.auth().currentUser?.uid) != nil) {
    //
    //
    //
    //
    //        }
    
    
    
}




