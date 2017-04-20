//
//  SettingsViewController.swift
//  ShrekClicker
//
//  Created by student8 on 4/12/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

import MediaPlayer

class SettingsViewController: UIViewController {
    
    var player3 = Shop()
    
    var speedUp = false
    
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let volumeView = MPVolumeView(frame: CGRect(x: 0, y: 40, width: 300, height: 30))
        self.view.addSubview(volumeView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(volumeChanged(notification:)),
                                               name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"),
                                               object: nil)
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        switch slider.value {
        case 0:
            player3.slow = true
            player3.pausePlay = false
            player3.fast = false
        case 1:
            player3.slow = false
            player3.pausePlay = true
            player3.fast = false
        case 2:
            player3.slow = false
            player3.pausePlay = false
            player3.fast = true
            print("Speed up")
        default:
            print("how")
        }
        
    }
    
    
    
    func volumeChanged(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            if let volumeChangeType = userInfo["AVSystemController_AudioVolumeChangeReasonNotificationParameter"] as? String {
                if volumeChangeType == "ExplicitVolumeChange" {
                    if #available(iOS 10.0, *) {
                        
                        print("Got into volume pressed")
                        
                        player3.pressVolume()
                        
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
    }
    
    
}
