//
//  VC_BaseVC.swift
//  TestFB
//
//  Created by NHF on 2016/8/25.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_BaseVC: UIViewController {
    
    internal var user: User=User()
    
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? VC_BaseVC{
            vc.user = self.user
            print(user.FBid)
            print(user.email)
        }
    }
}
