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
    
    
    
    
    @IBOutlet weak var headLineLabel: UILabel!
    
    let eggTimes : [String : Int] = ["Soft": 100, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer!
    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        timer.invalidate()
        let hardness  = sender.currentTitle! // Soft, Medium, Hard
        totalTime = eggTimes[hardness]! // butona basildiginda secilen sure int cinsinden geliyor boilTime degiskeninde
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        progressBar.progress = -1.0
        secondsPassed = 0
        headLineLabel.text = hardness
}
    
 @objc func updateTimer(){
    if secondsPassed < totalTime{
        
        let percentageProgress = (Float(secondsPassed) / Float(totalTime))
        
        secondsPassed += 1
        progressBar.progress = percentageProgress
        headLineLabel.text = String(totalTime - secondsPassed + 1 )
        
    }else if  (secondsPassed - totalTime == 0) {
        func playsound(soundName: String){
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()}
        progressBar.progress = 1
        playsound(soundName: "alarm_sound")
        headLineLabel.text = "Boiling Prosedure is Done, Bone Apetit "
        timer.invalidate()}
 }
}


