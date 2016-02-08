//
//  ViewController.swift
//  SegueTest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {       //adding UITextFeildDelegate allows viewcontroller to control textfield

    //MARK: Attributes
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextLabel: UILabel!
    
    @IBAction func TextFieldButtonClicked(sender: AnyObject) {
        
        if TextField.text?.characters.count > 0{
            TextLabel.text = TextField.text
        }
        else{
            TextLabel.text = "Nothing type in"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.TextField.delegate = self      //this viewcontroller is responsible for TextField
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //when user clicks outside of keyboard, end editing (close keyboard)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //close keyboard when return pressed
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        
        //could also probably trigger button functionality
        
        textField.resignFirstResponder()    //close the keyboard
        return true
    }
}

