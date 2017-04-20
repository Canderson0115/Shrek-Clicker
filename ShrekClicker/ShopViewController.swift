//
//  ShopViewController.swift
//  ShrekClicker
//
//  Created by student8 on 12/16/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    
    var player2 = Shop()
    
    var fairytaleCreatures = 0
    
    var timer = Timer()
    
    //outlets
    @IBOutlet weak var fairytaleCreaturesLabel: UILabel!
    
    @IBOutlet weak var powerShrekOutlet: UIButton!
    
    @IBOutlet weak var shrekPowerLevelOutlet: UILabel!
    
    @IBOutlet weak var autoClickOutlet: UIButton!
    
    @IBOutlet weak var numberOfAutoShreksOutlet: UILabel!
    
    @IBOutlet weak var getOutOfMaSwampOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Number of Creatures
        if player2.getOutOfMaSwamp
        {
            fairytaleCreaturesLabel.text = "You Win!"
            
            powerShrekOutlet.isEnabled = false
            
            autoClickOutlet.isEnabled = false
        }
        else
        {
            fairytaleCreaturesLabel.text = String(player2.numberOfFairytaleCreatures)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ShopViewController.autoClick), userInfo: nil, repeats: true)
        }
        
        //Auto Shrek Price
        autoClickOutlet.setTitle("\(player2.autoClickPrice) Fairytale Creatures: Auto Shrek", for: UIControlState.normal)
        
        //Number of Auto Shreks
        numberOfAutoShreksOutlet.text = String(player2.numberOfAutoClicks)
        
        //Power Shrek Price
        powerShrekOutlet.setTitle("\(player2.powerShrekPrice) Fairytale Creatures: Power Shrek", for: UIControlState.normal)
        
        //Shrek Power Level
        shrekPowerLevelOutlet.text = String(player2.shrekPowerLevel)
        
    }
    
    
    
    
    
    //actions
    @IBAction func addPowerShrek(_ sender: UIButton) {
        
        if player2.numberOfFairytaleCreatures >= player2.powerShrekPrice
        {
            
            player2.numberOfFairytaleCreatures -= player2.powerShrekPrice
            
            fairytaleCreaturesLabel.text = String(player2.numberOfFairytaleCreatures)
            
            player2.shrekIsPowerful = true
            
            player2.shrekPowerLevel += 1
            
            player2.powerShrekPrice *= 2
            
            powerShrekOutlet.setTitle("\(player2.powerShrekPrice) Fairytale Creatures: Power Shrek", for: UIControlState.normal)
            
            shrekPowerLevelOutlet.text = String(player2.shrekPowerLevel)
            
        }
        
    }
    
    @IBAction func donkey(_ sender: UIButton) {
        
        if player2.numberOfFairytaleCreatures >= player2.autoClickPrice
        {
            
            player2.numberOfFairytaleCreatures -= player2.autoClickPrice
            
            fairytaleCreaturesLabel.text = String(player2.numberOfFairytaleCreatures)
            
            player2.hasAutoClick = true
            
            player2.numberOfAutoClicks += 1
            
            player2.autoClickPrice *= 2
            
            autoClickOutlet.setTitle("\(player2.autoClickPrice) Fairytale Creatures: Auto Shrek", for: UIControlState.normal)
            
            numberOfAutoShreksOutlet.text = String(player2.numberOfAutoClicks)
            
        }
        
    }
    
    @IBAction func getOutOfMaSwamp(_ sender: Any) {
        
        if player2.numberOfFairytaleCreatures >= 10000
        {
            
            player2.getOutOfMaSwamp = true
            
            fairytaleCreaturesLabel.text = "You Win!"
            
            timer.invalidate()
            
            powerShrekOutlet.isEnabled = false
            
            autoClickOutlet.isEnabled = false
            
        }
    }
    
    
    //Functions
    
    func autoClick()
    {
        
        fairytaleCreaturesLabel.text = String(player2.numberOfFairytaleCreatures)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newVC = segue.destination as! ViewController
        
        newVC.player = player2
        
        if player2.getOutOfMaSwamp
        {
        
            newVC.shreksFace.isEnabled = false
            
        }
        
    }
    
    
    
    
    
}
