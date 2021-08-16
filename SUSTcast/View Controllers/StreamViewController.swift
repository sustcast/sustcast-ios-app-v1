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
import  MediaPlayer
import AVKit

class StreamViewController: UIViewController {
    
    var ref: DatabaseReference!
    var player: AVPlayer!

    //private let audioSession = AVAudioSession.sharedInstance()

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
       // let urlString = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
        let urlString = "http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"
        //let urlString = "http://aler.org:8000/radiorunacunapac.ogg.m3u"
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                debugPrint("AVAudioSession is Active and Category Playback is set")
                UIApplication.shared.beginReceivingRemoteControlEvents()
            setupCommandCenter()
            } catch {
                debugPrint("Error: \(error)")
            }
        guard let url = URL.init(string: urlString)
               else {
                   return
           }
           let playerItem = AVPlayerItem.init(url: url)
           player = AVPlayer.init(playerItem: playerItem)
    
           player.play()
           print("Playing")
       
    
        //self.ref.child("IcecastServer").obser
    
    }
    
    private func setupCommandCenter() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "SUSTcast"]

        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player.pause()
            return .success
        }
    }

}
