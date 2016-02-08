//
//  FirstViewController.swift
//  TODOtest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            
            todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //MARK: Tableview Methods
    
    //how many cells do we have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return todoList.count;
    }
    
    //define cell(s) and its style
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ProtoCell")
        
        cell.textLabel?.text = todoList[indexPath.row]
        
        return cell
    }
    
    //when user attempts to edit a cell (swipes on tableview cell)
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        //this editing style == swipe left
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todoList.removeAtIndex(indexPath.row)   //remove the cell user swiped on 
            
            //update todoList on disk
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            
            //refresh, reload table to get rid of cell
            todoListTable.reloadData()
        }
    }
    
    
    //refresh table
    override func viewDidAppear(animated: Bool) {
        todoListTable.reloadData()
    }

    
}

