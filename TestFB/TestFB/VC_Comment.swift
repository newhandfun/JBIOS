//
//  VC_Comment.swift
//  TestFB
//
//  Created by NHF on 2016/8/10.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Comment: VC_BaseVC,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var v_base: UIView!
    @IBOutlet weak var pickView_kind: UIPickerView!
    @IBOutlet weak var btn_kindOfComment: UIButton!
    
    //pickview
    var causeKind : [String] = ["１","2","3"]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return causeKind.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var view_cause: UIView!
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return causeKind[row]
    }
    
    @IBAction func clickSelectionKind(sender: AnyObject) {
        btn_kindOfComment.setTitle(causeKind[pickView_kind.selectedRowInComponent(0)] as String, forState: UIControlState.Normal)
        view_cause.hidden = true
    }
    @IBAction func clickChangeKind(sender: AnyObject) {
        view_cause.hidden = false
    }
    
    override func loadView() {
        super.loadView()
    }
    
}
