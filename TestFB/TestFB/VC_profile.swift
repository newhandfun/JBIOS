//
//  VC_profile.swift
//  TestFB
//
//  Created by NHF on 2016/9/14.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Profile : VC_BaseVC{
    
    
    @IBOutlet weak var text_email: UITextField!
    
    override func viewDidLoad() {
        if(user.email != ""){
            text_email.text = user.email
        }
    }
}