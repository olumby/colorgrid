//
//  GameMode.swift
//  ColorGrid
//
//  Created by Oliver Lumby on 19/12/14.
//  Copyright (c) 2014 Oliver Lumby. All rights reserved.
//

import UIKit

struct GameDefaults {
	static let time = 30
	static let maxTime = 60
	static let score = 0
}

class GameMode: NSObject {
	
	var colorStore:Array<UIColor>
	var buttonStore:Array<UIButton>
	
	var correctButtonTag:Int = 0
	
	let maxTime: Int = GameDefaults.maxTime
	var currentTime: Int = GameDefaults.time
	var scoreValue: Int = GameDefaults.score
	
	var timer: NSTimer!
	
	var paused: Bool = false
	
	var counterTick: () -> Void = {}

	
	init(buttons: Array<UIButton>, counterTick: (() -> Void))
	{
		self.colorStore = []
		self.buttonStore = buttons
		
		self.counterTick = counterTick
		
		super.init()
	}
	
	func startGame()
	{
		self.currentTime = GameDefaults.time
		self.scoreValue = GameDefaults.score
		
		self.startTimer()
		
//		currentTime = 30
//		scoreValue = 0
//		self.updateBackBox()
//		self.setColors()
//		self.startTimer()
	}
	
	func stopGame()
	{
		
	}
	
	func pauseGame()
	{
		
	}
	
	
	
	func startTimer()
	{
		timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countTimer"), userInfo: nil, repeats: true)
	}
	
	func counter()
	{
		self.counterTick()
	}
	
	
}
