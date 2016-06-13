//
//  FirstViewController.swift
//  To Do List
//
//  Created by Roydon Jeffrey on 6/12/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

//declare outside of the FirstViewController class to make it accessible in the SecondViewController
var toDoList = [String]()

//UITableViewDelegate allows the UIViewController to be responsible for the table view that was added to it in Main.storyboard
class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var tableItems: UITableView!
    
    //this represents the number of rows in the section of the table, which is the amount of elements within the toDoList array
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    //this will define the content of each individual cell by running this function based on the amount of values within the toDoList array
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //set the identifier exactly the same as in the prototype cell on Main.storyboard. Each cell will look identical to each other
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]  //each cell value will vary based on each index value of the toDoList array
        
        //to determine the cell content color based on its indexPath
        if indexPath.row % 2 == 0 {
            
            cell.textLabel?.textColor = UIColor.greenColor()
            
        }else {
            
           cell.textLabel?.textColor = UIColor.orangeColor()
            
        }
        
        return cell
    }
    
    //this function allows editing of the table view. In this case, we want to delete a specific row from the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)    //to determine which row to delete
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")  //update toDoList with the saved data in NSUserDefaults
            
            tableItems.reloadData()   //reload the tableView everytime an edit is made
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //only run this statement if toDoList contains values and assign the saved data in NSUserDefaults to toDoList
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]  //must convert anyObject to an array of strings
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableItems.reloadData()    //reload the tableView everytime this viewController appears
        
    }



}

