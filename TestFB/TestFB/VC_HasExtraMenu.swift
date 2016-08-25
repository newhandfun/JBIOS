//
//  VC_HasExtraMenu.swift
//  TestFB
//
//  Created by NHF on 2016/8/22.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_HasExtraMenu: VC_BaseVC {
    @IBOutlet var cter_extra: UIView!
    var extraViewDistance : CGFloat = 90
    
    func closeExtraView(times : NSTimeInterval){
        UIView.animateWithDuration(times, animations: {self.cter_extra.transform = CGAffineTransformMakeTranslation(self.cter_extra.transform.tx - self.extraViewDistance, self.cter_extra.transform.ty)})
    }
    
    func openExtraView(times : NSTimeInterval)  {
        UIView.animateWithDuration(times, animations: {self.cter_extra.transform = CGAffineTransformMakeTranslation(self.cter_extra.transform.tx + self.extraViewDistance,self.cter_extra.transform.ty)})
    }
}
