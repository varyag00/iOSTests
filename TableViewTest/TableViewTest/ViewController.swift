//
//  ViewController.swift
//  TableViewTest
//
//  Created by Dan Gonzalez on 2016-02-07.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var cellContent = ["Dan", "Maria", "Jose", "Ingrid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        //4 rows of in our tableview, because we want to display all 4 elements of the array
        return cellContent.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //give cell style and identify the prototype cell we're going to use ("Cell", which is defined in the main storyboard as the tableview cell prototype)
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //what we want to change in our cell
        cell.textLabel?.text = cellContent[indexPath.row] //displays the respective row
        
        return cell
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

