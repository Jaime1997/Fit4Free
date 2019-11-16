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
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer.loadVideoURL(NSURL(string: url) as! URL)
    }
    
}
