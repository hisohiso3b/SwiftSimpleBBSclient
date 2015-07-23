//
//  FirstViewController.swift
//  SimpleBBS
//
//  Created by hiso on 2015/07/22.
//  Copyright (c) 2015年 祐輔 花田. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FirstViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        refreshTable();
    }

    func refreshTable(){
        
    }

}

