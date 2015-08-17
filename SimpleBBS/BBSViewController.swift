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
    var contents:JSON = JSON([]);

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
        Alamofire.request(.GET, baseurl+"get?0=Hello&1=World&2=foo&3=bar")
            .responseJSON { request, response, json, error in
                if error != nil {
                    println(error)
                    self.errorMessage()
                }else{
                    var json = JSON(json!)
                    self.contents = json["args"]
                    println(self.contents)
                    self.tableView.reloadData()
                }
        }
    }
    
    func errorMessage(){
        let alertController = UIAlertController(
            title: "error",
            message: "connection error",
            preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default){
            action in
            println("ok pushed")
        }
        
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Num: \(indexPath.row)")
        println("Value: \(contents[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(contents.count)
        return contents.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Cell取得
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        
        // 値を設定
        var rowString: String = "\(indexPath.row)"
        cell.textLabel!.text = contents[rowString].string!
        
        return cell
    }
    

}

