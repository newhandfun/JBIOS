//
//  VC_Result.swift
//  TestFB
//
//  Created by NHF on 2016/8/22.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Result: VC_HasExtraMenu {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickTimes(sender: AnyObject) {
            showMessage("營業時間：9:00-18:00", buttonText: "我知道了！")
    }
    
    @IBAction func clickContact(sender: AnyObject) {
        showMessage("電話：", buttonText: "我知道了！")
    }
    
    @IBAction func clickAddress(sender: AnyObject) {
        showMessage("地址：", buttonText: "我知道了！")
    }

    
    func showMessage(message:String!,buttonText:String!){
        let quetion = UIAlertController(title: nil, message: message, preferredStyle: .Alert);
        let callaction = UIAlertAction(title: buttonText, style: .Default , handler:nil);
        quetion.addAction(callaction);
        self.presentViewController(quetion, animated: true, completion: nil);
    }
    
    
}
