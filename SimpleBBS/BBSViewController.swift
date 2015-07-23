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
        Alamofire.request(.GET, baseurl+"get_posts")
            .responseJSON { request, response, json, error in
                if error != nil {
                    println(error)
                    self.errorMessage()
                }else{
                    var contents = JSON(json!)
                    println(contents)
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
    (実装必須)
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(contents[indexPath.row])"
        
        return cell
    }
    

}

