//
//  HowToViewController.swift
//  ColorGrid
//
//  Created by Oliver Lumby on 28/09/14.
//  Copyright (c) 2014 Oliver Lumby. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
	
	@IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		
		//		        self.webView!.mainFrame.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("default", ofType: "html")!)!))
		
		self.webView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("howTo", ofType: "html")!)!))
		
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

