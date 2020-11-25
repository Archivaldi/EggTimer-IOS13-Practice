//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextLabel: UILabel!
    
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 480, "Hard": 720];
    var timeLeft: Int = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        let hardness = sender.currentTitle!
//            print(eggTimes[hardness]!)
//        }
        timer.invalidate()
        
        if let hardness = sender.currentTitle {
            if let answer = eggTimes[hardness] {
                timeLeft = answer
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func startTimer() {
        if timeLeft > 0 {
            print("\(timeLeft) seconds")
            timeLeft -= 1
        } else {
            TextLabel.text = "Done!"
        }
        
    }
}


