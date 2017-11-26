//
//  ViewController.swift
//  GrocerySplitter
//
//  Created by Shivam Desai on 11/19/17.
//  Copyright © 2017 Shivam Desai. All rights reserved.
//

import UIKit

var grocerylist:[String] = []

var pricelist:[Float] = []

var peoplelist:[String] = []

var peopletotals:[Float] = [];

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItemPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MainToAddItem", sender: self)
    }

    @IBAction func AddPeopleButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "MainToAddPeople", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func newsessionbuttonpressed(_ sender: Any) {
        grocerylist.removeAll()
        pricelist.removeAll()
        peoplelist.removeAll()
        peopletotals.removeAll()
    }
    
    @IBAction func splitbuttonpressed(_ sender: Any) {
        if ((grocerylist.isEmpty) || ((pricelist.isEmpty)))
        {
            displayAlert(userMessage: "Please add items to the grocery list or add people.");
            return;
        }
        else
        {
            performSegue(withIdentifier: "HometoSplit", sender: self)
        }
    }
    
    func displayAlert(userMessage:String)
    {
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
}

