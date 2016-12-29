//
//  ViewController.swift
//  lecture1
//
//  Created by Daniel Bromberg on 6/20/16.
//  Copyright © 2016 BaseZen. All rights reserved.
//

import UIKit


struct Constants {
    static let WhiteSpace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
}


extension String {
    // Computed property: "   abc  " -> "abc"
    var trimmed: String {
        get {
            return self.stringByTrimmingCharactersInSet(Constants.WhiteSpace)
        }
    }
}


class ViewController: UIViewController, UITextFieldDelegate {
    // Properties on top
    @IBOutlet weak var userName: UITextField! {
        didSet {
            // userName.delegate = self
            userName.addTarget(self, action: #selector(ViewController.updateUI(_:)), forControlEvents: .AllEditingEvents)
        }
    }
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    // Then functions, @IBActions first
    @IBAction func greetMeTapped(sender: AnyObject) {
        print("Greeting was tapped")
        updateUI(sender)
    }
    
    
    
    func updateUI(sender: AnyObject) {
        if let name = userName.text where !name.trimmed.isEmpty {
            let greeting = "Hello, \(name.trimmed)"
            greetingLabel.text = greeting
        }
        else {
            greetingLabel.text = "<Waiting for your name>"
        }
   }
    
    
    // Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - UITextfieldDelegate
    
    //    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        
//        greetingLabel.text = "Hello, \(userName.text!)"
//
//        return true
//    }
}

