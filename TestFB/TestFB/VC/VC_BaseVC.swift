//
//  VC_BaseVC.swift
//  TestFB
//
//  Created by NHF on 2016/8/25.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_BaseVC: UIViewController {
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
