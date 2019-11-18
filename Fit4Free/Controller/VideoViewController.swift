//
//  VideoViewController.swift
//  Fit4Free
//
//  Created by Jaime Garza on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation
import AVKit
import YouTubePlayer

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var url = ""
    var time = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPlayer.playerVars = ["controls": 0, "playsinline": 1, "autohide": 1, "showinfo": 0, "autoplay": 0, "modestbranding": 1] as YouTubePlayerView.YouTubePlayerParameters
        
        videoPlayer.loadVideoURL(NSURL(string: url)! as URL)
        timeLabel.text = secondsToMinutesSeconds(seconds: time)
    }
    
    func secondsToMinutesSeconds (seconds : Int) -> (String) {
        return "\((seconds % 3600) / 60):" + "\(((seconds % 3600) % 60))"
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if(isTimerRunning == false)
        {
            videoPlayer.play()
            runTimer()
            isTimerRunning = true
        }
        
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(VideoViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if (time < 1)
        {
            timer.invalidate()
            timeLabel.text = "Finished!"
            isTimerRunning = false
        }
        
        else {
            
            time -= 1     //This will decrement(count down)the seconds.
            timeLabel.text = secondsToMinutesSeconds(seconds: time) //This will update the label.
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
        if isTimerRunning == true {
             timer.invalidate()
             videoPlayer.pause()
             isTimerRunning = false

        }
    }
    
}
