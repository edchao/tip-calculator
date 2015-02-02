//
//  ViewController.swift
//  tips
//
//  Created by Ed Chao on 2/1/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!

    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.quoteLabel.text = "What's the damage?"
        
        self.billLabel.alpha = 0
        self.billField.alpha = 0
        
        self.tipLabel.alpha = 0
        self.tipField.alpha = 0
        
        self.totalLabel.alpha = 0
        self.totalValueLabel.alpha = 0
   
        self.billLabel.frame = CGRect(x: 16, y: 176, width:27, height:15)
        self.billField.frame = CGRect(x: 95, y: 151, width:209, height:59)
        
        
        UIView.animateWithDuration(0.4, animations: {

            self.billLabel.alpha = 1
            self.billField.alpha = 1
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var billAmount = NSString(string:billField.text).doubleValue
        
        if billField.text != nil {
        
            UIView.animateWithDuration(0.4, animations: {
                self.tipLabel.alpha = 1
                self.tipField.alpha = 1
                self.totalLabel.alpha = 1
                self.totalValueLabel.alpha = 1
                
                
                self.billField.frame = CGRect(x: 95, y: 48, width:209, height:59)
                self.billLabel.frame = CGRect(x: 16, y: 67, width:27, height:15)

                
            })
        }
        
        if billField.text == "" || billField.text == nil {
            UIView.animateWithDuration(0.4, animations: {
                self.tipLabel.alpha = 0
                self.tipField.alpha = 0
                self.totalLabel.alpha = 0
                self.totalValueLabel.alpha = 0
                
                
                self.billLabel.frame = CGRect(x: 16, y: 176, width:27, height:15)
                self.billField.frame = CGRect(x: 95, y: 151, width:209, height:59)

            })
            
        }
        
        
        var tipPercentage = NSString(string: tipField.text).doubleValue * 0.01
        
        
        if tipPercentage <= 0.20 {
            quoteLabel.text = "Be generous."
        }
        if tipPercentage > 0.20 && tipPercentage <= 0.5 {
            quoteLabel.text = "You can always give more."
        }
        if tipPercentage > 0.5 {
            quoteLabel.text = "Baller."
            
        }
        
        

        
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        totalValueLabel.text = String(format: "$%.2f", total)
    }

    
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

