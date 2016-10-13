//
//  VC_Discuss.swift
//  TestFB
//
//  Created by NHF on 2016/10/10.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Discuss : VC_BaseVC,UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Store.Discuss?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify, forIndexPath: indexPath) as! TVC_Discuss
        
        cell.lbl_name.text = Store.Discuss![indexPath.row]["nickname"]
        cell.lbl_comment.text = Store.Discuss![indexPath.row]["content"]
        cell.lbl_time.text = Store.Discuss![indexPath.row]["time"]
        
        return cell
    }
}

class TVC_Discuss :UITableViewCell{
    @IBOutlet var lbl_name : UILabel!
    @IBOutlet var lbl_comment : UILabel!
    @IBOutlet var lbl_time : UILabel!

}