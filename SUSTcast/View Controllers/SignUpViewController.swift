//
//  SignUpViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/5/21.
//

import UIKit
import FirebaseAuth
import Toaster
import Firebase


class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
        
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    
    @IBOutlet weak var signUP: UIButton!
    
    @IBOutlet weak var departments: UITextField!
    
    @IBOutlet weak var Depts: UIPickerView!
    
    let departmentsList = ["ANP", "ARC", "BMB", "BNG", "BUS", "CEE", "CEP", "CHE", "CSE", "ECO", "EEE", "ENG", "FES", "FET", "GEB", "GEE", "IPE", "MAT", "MEE", "OCG", "PAD", "PHY", "PME", "PSS", "SCW", "SOC", "STA", "SWE"]
    
    var PickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userName.delegate = self
        emailAddress.delegate = self
        phoneNumber.delegate = self
        password.delegate = self
        confirmPass.delegate = self
        departments.delegate = self
        PickerView.delegate = self
        PickerView.dataSource = self

        departments.inputView = PickerView
        
        Helper.RoundButton(signUP)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
           textField.resignFirstResponder()
           emailAddress.becomeFirstResponder()
        } else if textField == emailAddress {
           textField.resignFirstResponder()
           phoneNumber.becomeFirstResponder()
        } else if textField == phoneNumber {
           textField.resignFirstResponder()
            password.becomeFirstResponder()
        }
        else if textField == password {
           textField.resignFirstResponder()
           confirmPass.becomeFirstResponder()
            
        }
        else if textField == confirmPass {
           textField.resignFirstResponder()
            departments.becomeFirstResponder()
            
        }
        else if textField == departments {
           textField.resignFirstResponder()
        
            
        }
        
       return true
      }
    
    
    
    
    func validateFields() -> Bool {
        
        if (userName.text! == "" ||
            emailAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmPass.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            
            return true
        }
        
        return false
    }

    @IBAction func signupFunc(_ sender: Any) {
        
        let error = validateFields()
        
        let selectedDepartment = departments.text!
        let name = userName.text!
        let email = emailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(error){
            
            Toast(text: "Please fill up all the fileds!").show()
            
        } else {
            
            Auth.auth().createUser(withEmail: email, password: pass) { (result, err) in
                
                if (err != nil) {
                    //Error
                    Toast(text: "Error creating user").show()
                } else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("sustcast_user").addDocument(data: ["userName": name, "department": selectedDepartment, "emailAddress":email, "phoneNumber":phone,"authenticated":false, "uid":result!.user.uid ]) {
                        (error) in
                        
                        if error != nil {
                            
                        }
                    }
                    
                    
                    //transition
                    
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardId.homeViewController) as? HomeViewController
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                    
                    Toast(text: "Register sucessful").show()
                    
                    
                    
                }
            }
        }
        
        
        
    }
    
    
    
}

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1  }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departmentsList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return departmentsList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        departments.text = departmentsList[row]
        departments.resignFirstResponder()
    }
    
    
}
