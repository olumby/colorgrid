//
//  AppColors.swift
//  ColorGrid
//
//  Created by Oliver Lumby on 28/09/14.
//  Copyright (c) 2014 Oliver Lumby. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func appRed() -> UIColor
    {
        return UIColor(red: 255.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
    }
    
    class func appBoxDark() -> UIColor
    {
        return UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }
    
    class func appBoxLight() -> UIColor
    {
        return UIColor(red: 254.0/255.0, green: 254.0/255.0, blue: 254.0/255.0, alpha: 1.0)
    }
    
    class func appDisabedButton() -> UIColor
    {
        return UIColor(red: 180.0/255.0, green: 180.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    }
    
    class func appRandomColors() -> Dictionary<String, UIColor>
    {
        let randomHue = randomNumber(0, 1)
        let randomSaturation = randomNumber(0.5, 0.7)
        let randomBrightness = randomNumber(0.8, 0.85)
        
        let normalColor = UIColor(hue: randomHue, saturation: randomSaturation, brightness: randomBrightness, alpha: 1)
        let lightColor = UIColor(hue: randomHue, saturation: randomSaturation, brightness: 0.9, alpha: 1)
        
        return ["normal": normalColor, "light": lightColor]
    }
    
}

func randomNumber(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
    return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}