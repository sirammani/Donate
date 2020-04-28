//
//  ViewController.swift
//  CoustomLogin
//
//  Created by SRIRAM HKR on 4/22/20.
//  Copyright © 2020 SRIRAM HKR. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var SignupButton: UIButton!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }


    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    
    func setUpElements () {
        Utilities.styleFilledButton(SignupButton)
        
        Utilities.styleFilledButton(LoginButton)
    }
    
    
    
    func setUpVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
    }
}

