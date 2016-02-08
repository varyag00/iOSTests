//
//  SecondViewController.swift
//  TODOtest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var todoitemTextField: UITextField!
    
    @IBAction func AddTodoitem(sender: AnyObject) {
        
        if todoitemTextField.text?.characters.count > 0{
            
            //add it up
            todoList.append(todoitemTextField.text!)
            
            //save it to disk
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            
            //clear textfield
            todoitemTextField.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //CODE YOU ADD ANY TIME YOU USE A KEYBOARD
    
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

