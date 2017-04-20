//
//  Shop.swift
//  ShrekClicker
//
//  Created by student8 on 2/24/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

import AVFoundation

class Shop
{
    
    var numberOfFairytaleCreatures = 0
    
    var shrekIsPowerful = false
    
    var hasAutoClick = false
    
    var numberOfAutoClicks: Int = 0
    
    var shrekPowerLevel: Int = 0
    
    var powerShrekPrice: Int = 30
    
    var autoClickPrice: Int = 20
    
    var getOutOfMaSwamp = false
    
    var music: AVAudioPlayer!
    
    var slow = false
    
    var pausePlay = true
    
    var fast = false
    
    func playSound() {
        print("Started function")
        let url = Bundle.main.url(forResource: "AllStar", withExtension: "mp3")!
        print("Playing sound")
        do {
            music = try AVAudioPlayer(contentsOf: url)
            guard let music = music else { return }
            
            print("OK so far")
            
            music.enableRate = true
            
            music.prepareToPlay()
            music.play()
            
            music.numberOfLoops = 1000000000000
            
            print("Working")
            
        } catch let error {
            print(error.localizedDescription)
            print("Oops")
        }
    }
    
    func pressVolume()
    {
        if fast
        {
            if #available(iOS 10.0, *) {
                
                if (music.rate) < Float(1.5)
                {
                    music.rate += 0.1
                }
                else
                {
                    print("too fast")
                }
                print("Rate:" + String(describing: music?.rate))
                
            } else {
                // Fallback on earlier versions
            }
        }
        else if slow
        {
            if #available(iOS 10.0, *) {
                
                if (music.rate) > Float(0.49)
                {
                    music.rate -= 0.1
                }
                else
                {
                    print("too slow")
                }
                print("Rate:" + String(describing: music?.rate))
                
            } else {
                // Fallback on earlier versions
            }
        }
        else if pausePlay
        {
            if #available(iOS 10.0, *) {
                
                if music.isPlaying
                {
                    music.pause()
                }
                else
                {
                    music.play()
                }
                
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}
