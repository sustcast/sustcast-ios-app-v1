//
//  SignUpViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/5/21.
//

import UIKit
import FirebaseAuth
import Toaster


class SignUpViewController: UIViewController {

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

        PickerView.delegate = self
        PickerView.dataSource = self

        departments.inputView = PickerView
        
        Helper.RoundButton(signUP)
    }

    @IBAction func signupFunc(_ sender: Any) {
        let selectedDepartment = departments.text!
        Toast(text: selectedDepartment).show()
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
