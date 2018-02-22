//
//  ViewController.swift
//  week1_one_button
//
//  Created by Dongphil Yoo on 1/26/18.
//  Copyright © 2018 dongphilyoo. All rights reserved.
//



import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var button: UIButton!
    
    var player = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "sfx", ofType: "mp3")
    //var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            print("Could not load file")
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func play(_ sender: Any) {
        //if isPlaying == false {
            player.play()
            //isPlaying = true
            //button.setTitle("Pause", for: .normal)
//}else {
//            player.pause()
//            isPlaying = false
//            button.setTitle("Play", for: .normal)
//        }
    }
}


