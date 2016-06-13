//
//  SecondViewController.swift
//  To Do List
//
//  Created by Roydon Jeffrey on 6/12/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

//to allow the return key to remove keyboard upon click by assigning newItem.delegate to self
class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var newItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(newItem.text!)  //add newItem to the toDoList array
        
        newItem.text = ""   //to empty out the text field area
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")   //update toDoList with saved data in NSUserDefaults
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)  //to remove keyboard when user click anywhere within the viewController but outside the text field and button
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.newItem.resignFirstResponder()   //remove software keyboard when return key is pressed
        
        return true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.newItem.delegate = self    //needed in order for the return key to remove the keyboard when pressed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

