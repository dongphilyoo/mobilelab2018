//
//  ViewController.swift
//  week2_custom_unlock
//
//  Created by Dongphil Yoo on 2/6/18.
//  Copyright © 2018 dongphilyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passcode = [0, 0, 1, 0, 1, 0]
    var inputs = [Int]()
    var count = 0

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetScreen()
      
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        myBtn.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        longGesture.minimumPressDuration = 0.3
        //longGesture.allowableMovement = 15
        myBtn.addGestureRecognizer(longGesture)
    }
    
    func resetScreen() {
        statusLabel.textColor = UIColor.black
        statusLabel.text = "Send Morse"
        
        resetBtn.isHidden = true
    
        inputs.removeAll()
    }
    
    @IBAction func handleResetBtn(_ sender: UIButton) {
        resetScreen()
    }
    
    @objc func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        inputs.append(0)
        codeCheck()
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            inputs.append(1)
            print(inputs)
            codeCheck()
        }
        else if sender.state == .began {
            
        }
    }
    
    func codeCheck(){
        if inputs.count == 6 {
            print("Morse!!!")
            if inputs == passcode {
                statusLabel.textColor = UIColor.black
                statusLabel.text = "Unlocked"
                resetBtn.isHidden = false
            } else {
                statusLabel.textColor = UIColor.black
                statusLabel.text = "Try Again"
                count += 1
                inputs.removeAll()
                if count >= 3 {
                    statusLabel.textColor = UIColor.red
                    statusLabel.text = "This will explode in 10sec."
                    count = 0
                }
            }
        }
    }
}
