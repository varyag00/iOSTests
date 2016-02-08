//
//  ViewController.swift
//  NavigationTest
//
//  Created by Dan Gonzalez on 2016-02-07.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Attributes
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = NSTimer()
    
    
    //MARK: Actions
    
    @IBAction func startTimer(sender: UIBarButtonItem) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("IncreaseTimer"), userInfo: nil, repeats: true)
        
//        timer.fire()
    }
    
    @IBAction func pauseTimer(sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: UIBarButtonItem) {
        timer.invalidate()
        time = 0;
        timerLabel.text = String(time)
        //timer = NSTimer()
    }
    
    var time = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer()
        //Making a timer app will start timer, stop timer, and reset
    }

    func IncreaseTimer(){
        
        time++
        timerLabel.text = String(time)
        //print("\(time) seconds have passed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

