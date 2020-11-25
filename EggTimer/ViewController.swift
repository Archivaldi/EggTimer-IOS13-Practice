//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var TextLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 8, "Hard": 12];
    var totalTime: Int = 0
    var secondsPassed: Int = 0;
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        let hardness = sender.currentTitle!
//            print(eggTimes[hardness]!)
//        }
        secondsPassed = 0;
        progressBar.progress = 0.0
        timer.invalidate()
        
        if let hardness = sender.currentTitle {
            if let answer = eggTimes[hardness] {
                totalTime = answer
                TextLabel.text = hardness
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func startTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        } else {
            timer.invalidate()
            TextLabel.text = "Done!"
            playSound()
        }
        
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
}


