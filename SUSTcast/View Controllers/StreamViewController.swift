//
//  StreamViewController.swift
//  SUSTcast
//
//  Created by Abrar on 6/15/21.
//

import UIKit
import Firebase
import AVFoundation
import Toaster

class StreamViewController: UIViewController {
    
    var ref: DatabaseReference!
    var player: AVPlayer!

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
        
        var isConnectedToInternet: Bool { Helper.reachable(host: "apple.com") }
        
        if(isConnectedToInternet){
            Toast(text: "Network available").show()

        } else{
            Toast(text: "No internet").show()

        }
        
        
       // var playing : Bool? = false
        let urlString = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
        guard let url = URL.init(string: urlString)
               else {
                   return
           }
           let playerItem = AVPlayerItem.init(url: url)
           player = AVPlayer.init(playerItem: playerItem)
    
           //player.play()
           //print("Playing")
       
    
        //self.ref.child("IcecastServer").obser
    
    }

}
