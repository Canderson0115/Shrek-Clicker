//
//  ViewController.swift
//  ShrekClicker
//
//  Created by student8 on 12/15/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

import AVFoundation

import CoreLocation

import MediaPlayer

class ViewController: UIViewController {
    
    var cool = "cool"
    
    var player = Shop()
    
    var timer = Timer()
    
    let locationManager = CLLocationManager()
    
    //outlets
    @IBOutlet weak var creatureCountLabel: UILabel!
    
    @IBOutlet weak var shreksFace: UIButton!
    
    
    
    
    var fairytaleCreaturesCount = 0
    
    var shrekIsPowerful = false
    
    var hasAutoClick = false
    
    var numberOfAutoClicks = 0
    
    var shrekPowerLevel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let volumeView = MPVolumeView(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
                self.view.addSubview(volumeView)
        //        volumeView.backgroundColor = UIColor.red
        
        NotificationCenter.default.addObserver(self, selector: #selector(volumeChanged(notification:)), name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"), object: nil)
        
        print("View loading")
        
        player.playSound()
        
        print("Sounding sound")
        
        if player.getOutOfMaSwamp
        {
            creatureCountLabel.text = "You Win!"
            
            shreksFace.isEnabled = false
        }
        else
        {
            creatureCountLabel.text = String(player.numberOfFairytaleCreatures)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.autoClick), userInfo: nil, repeats: true)
        }
        
        locationManager.startUpdatingLocation()
        
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        for location in locations
        {
            print(location)
        }
    }
    
    
    //actions
    @IBAction func tapShrekFace(_ sender: AnyObject) {
        
        player.numberOfFairytaleCreatures += 1
        
        if player.shrekIsPowerful == true
        {
            player.numberOfFairytaleCreatures += player.shrekPowerLevel
        }
        
        creatureCountLabel.text = "\(player.numberOfFairytaleCreatures)"
        
    }
    
    @IBAction func muteHaPranked(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
    //functions
    
    func autoClick()
    {
        
        if player.getOutOfMaSwamp
        {
            creatureCountLabel.text = "You Win!"
            
            timer.invalidate()
        }
        else
        {
            if player.hasAutoClick
            {
                player.numberOfFairytaleCreatures += player.numberOfAutoClicks
                
                creatureCountLabel.text = "\(player.numberOfFairytaleCreatures)"
            }
        }
        
    }
    
    var backgroundMusicPlayer = AVAudioPlayer()
    
    func volumeChanged(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            if let volumeChangeType = userInfo["AVSystemController_AudioVolumeChangeReasonNotificationParameter"] as? String {
                if volumeChangeType == "ExplicitVolumeChange" {
                    
                    player.pressVolume()
                    
                }
            }
        }
    }
    
    var programmaticVolumeChange = false
    
    func changeVolumeProgramatically() {
        
        programmaticVolumeChange = true
        //change volume programmatically after
        
    }
    
    func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutableRawPointer) {
        
        if keyPath == "outputVolume"{
            
            if programmaticVolumeChange {
                
                programmaticVolumeChange = false
                
            } else {
                
                print("YAY")
                
            }
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Trade"
        {
            
            let newVC = segue.destination as! ShopViewController
            
            newVC.player2 = player
            
        }
        else
        {
            
            let newVC = segue.destination as! SettingsViewController
            
            newVC.player3 = player
            
        }
        
    }
    
    
}

