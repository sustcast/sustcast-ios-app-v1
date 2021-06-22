//
//  StreamViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/15/21.
//

import UIKit
import Firebase

class StreamViewController: UIViewController {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("song")

        
        self.ref.child("title_show").observeSingleEvent(of: .value, with: { (snapshot) in
        if let title = snapshot.value as?  String {
        print("The value from the database: \(title)")
        }
        else{
            print("Error")
        }
        })
        
    
        //self.ref.child("IcecastServer").obser
    
    }

}
