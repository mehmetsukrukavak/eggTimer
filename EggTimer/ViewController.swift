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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    /*
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    */
    let eggTimes = ["Soft": 300, "Medium": 400, "Hard": 720 ]
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        secondsPassed = 0
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        /*
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        
        }
         */
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime  {
            secondsPassed += 1
            progressBar.progress =  Float(secondsPassed) / Float(totalTime)
             
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
        }
    }
    
}
