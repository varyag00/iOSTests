//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Dan Gonzalez on 2016-03-02.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       //set viewcontroller size to freeform and give it the height of the scrollview
        
        myScrollView.backgroundColor = UIColor.blueColor()
        
        myScrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height + 1000)
        
        myScrollView.addSubview(topLabel)
        myScrollView.addSubview(bottomLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

