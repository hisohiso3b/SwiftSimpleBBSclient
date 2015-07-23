//
//  SecondViewController.swift
//  SimpleBBS
//
//  Created by hiso on 2015/07/22.
//  Copyright (c) 2015年 祐輔 花田. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var contentTextview: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func sendMessage(sender: AnyObject) {
        if nameTextfield.text != "" && contentTextview.text != "" {
            
        }else{
            
            let alertController = UIAlertController(
                title: "error",
                message: "input name and contents",
                preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default){
                action in
                println("ok pushed")
            }
            
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
    }

}

