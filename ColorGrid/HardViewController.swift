//
//  HardViewController.swift
//  ColorGrid
//
//  Created by Oliver Lumby on 29/09/14.
//  Copyright (c) 2014 Oliver Lumby. All rights reserved.
//

import UIKit


class HardViewController: UIViewController {

    @IBOutlet weak var backgroundBox: UIView!
    @IBOutlet weak var backgroundCounter: UIView!
    @IBOutlet weak var writtenCounter: UILabel!
    @IBOutlet weak var writtenScore: UILabel!
    
    @IBOutlet weak var buttonBox: UIView!
    @IBOutlet weak var colorOne: UIButton!
    @IBOutlet weak var colorTwo: UIButton!
    @IBOutlet weak var colorThree: UIButton!
    @IBOutlet weak var colorFour: UIButton!
    
    var colorStore:Array<UIColor>!
    
    var correctButtonTag:Int = 0
    
    let buttonCount = 4
    let maxTime:Int = 60
    var currentTime:Int = 30
    var scoreValue = 0
    
    var timer: NSTimer!
    
    var paused: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.backgroundBox.backgroundColor = UIColor.appBoxDark()
        self.backgroundCounter.backgroundColor = UIColor.appBoxLight()
        
        self.setUpGame()
    }
    
    @IBAction func unwindToHard (segue : UIStoryboardSegue)
    {
        self.setUpGame()
    }
    
    func setUpGame()
    {
        currentTime = 30
        scoreValue = 0
        self.updateBackBox()
        self.setColors()
        self.startTimer()
    }
    
    func startTimer()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countTimer"), userInfo: nil, repeats: true)
    }
    
    func stopGame()
    {
        self.timer.invalidate()
        self.timer = nil
    }
    
    
    @IBAction func pauseGame()
    {
        if paused {
            self.startTimer()
            self.restoreColors()
            
            self.paused = false
        } else {
            self.stopGame()
            self.pauseColors()
            
            self.paused = true
        }
    }
    
    @IBAction func hitButton(sender : UIButton)
    {
        if sender.tag == correctButtonTag {
            // Correct Answer
            self.setColors()
            if self.currentTime < 60 {
                self.currentTime += 2
                self.scoreValue += 5
            }
        } else {
            // Incorrect Answer
            if self.currentTime < 5 {
                self.currentTime = 0
            } else {
                self.currentTime -= 5
            }
        }
        self.countTimer()
    }
    
    func countTimer()
    {
        if(currentTime < 1) {
            self.performSegueWithIdentifier("gameOver", sender: nil)
        }
        
        self.updateBackBox()
        
        if(currentTime > 0) {
            self.currentTime--
        }
        
    }
    
    func pauseColors()
    {
        self.colorStore = Array<UIColor>()
        
        for view in self.buttonBox.subviews {
            if view.isKindOfClass(UIButton) {
                var btn:UIButton = view as UIButton
                
                self.colorStore.append(btn.backgroundColor!)
                
                btn.backgroundColor = UIColor.appDisabedButton()
                btn.enabled = false
            }
        }
    }
    
    func restoreColors()
    {
        var i = 0
        for view in self.buttonBox.subviews {
            if view.isKindOfClass(UIButton) {
                var btn:UIButton = view as UIButton
                
                btn.backgroundColor = self.colorStore[i]
                btn.enabled = true
                
                i++
            }
        }
    }
    
    func setColors()
    {
        let newColors = UIColor.appRandomColors()
        
        let randomTag:Int = Int(arc4random()) % self.buttonCount;
        
        for view in self.buttonBox.subviews {
            if view.isKindOfClass(UIButton) {
                var btn:UIButton = view as UIButton
                
                if btn.tag == randomTag {
                    btn.backgroundColor = newColors["light"]
                    self.correctButtonTag = randomTag
                } else {
                    btn.backgroundColor = newColors["normal"]
                }
            }
        }
        
    }
    
    func updateBackBox()
    {
        let viewWidth = self.view.frame.size.width
        let currentWidth = self.backgroundCounter.frame.size.width
        
        let newWidth = (CGFloat(self.currentTime)/CGFloat(self.maxTime) * viewWidth)
        
        var newFrame = self.backgroundCounter.frame
        newFrame.size.width = newWidth
        
        UIView.animateWithDuration(0.2, animations: {
            self.backgroundCounter.frame = newFrame
            self.writtenCounter.text = String(self.currentTime)
            self.writtenScore.text = String(self.scoreValue)
        })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.stopGame()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}