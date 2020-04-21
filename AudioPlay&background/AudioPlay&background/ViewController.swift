//
//  ViewController.swift
//  AudioPlay&background
//
//  Created by Srans022019 on 13/02/20.
//  Copyright © 2020 Srans02. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
            // play background music
            let audioSession = AVAudioSession.sharedInstance()
            
            do{
                
                try audioSession.setCategory(AVAudioSession.Category.playback)
                
            }catch{
                
            }
            
        }catch{
            
            print(error)
        }
        

        
        // Do any additional setup after loading the view.
    }

    @IBAction func playBtn(_ sender: Any) {
        
        audioPlayer.play()
        
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        
        if audioPlayer.isPlaying{
            
            audioPlayer.pause()
            
        }else{
            print("not able to play")
        }
    
    }
    
    @IBAction func resetBtn(_ sender: Any) {
    
        if audioPlayer.isPlaying{
            
            audioPlayer.currentTime = 0
            audioPlayer.play()
            
        }else{
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
    }
}

