//
//  VC_MainSence.swift
//  TestFB
//
//  Created by NHF on 2016/8/6.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_MainSence: VC_HasExtraMenu{
    
    //UserData
    var userData : User = User()
    
    
    //tutorial
    @IBOutlet weak var btn_tutorial: UIButton!
    @IBOutlet weak var view_tutorial: UIView!
    @IBOutlet weak var Cont_tuto: UIView!
    
   
    @IBAction func clickTutorial(sender: AnyObject){
        view_tutorial.hidden = !view_tutorial.hidden
        view_bigMenu.hidden = true
        Cont_tuto.hidden = false
        
    }
    
    
    //menu button
    @IBOutlet weak var btn_menu: UIButton!
    @IBOutlet weak var btn_goalSelection: UIButton!
    @IBOutlet weak var view_bigMenu: UIView!
    @IBOutlet weak var silder_price: UISlider!
    @IBOutlet weak var lbl_price: UILabel!
    var currentPrice : Int = 100
    
    @IBAction func clickMenuButton(sender: AnyObject) {
        btn_menu.hidden = true
        view_tutorial.hidden = false
        Cont_tuto.hidden = true
        view_bigMenu.hidden = false
    }
    
    @IBAction func btn_goalSelection(sender: AnyObject) {
        view_tutorial.hidden = true
        btn_menu.hidden = false
        view_bigMenu.hidden = true
        
        SetFindCondition()
    }
    
    
    @IBOutlet weak var btn_lid: UIButton!
    func SetFindCondition(){
        var angle : CGFloat = -0.5
        for index in 1...5{
            angle *= -1
            LipSwing(NSTimeInterval(index) * NSTimeInterval( 0.3), rotaion: angle)
        }
        LipSwing(2, rotaion: 0)
    }
    
    func LipSwing(time:NSTimeInterval,rotaion : CGFloat){
        
        UIButton.animateWithDuration(time, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations:
            {
                self.btn_lid.transform = CGAffineTransformMakeRotation(rotaion)
            }, completion: nil)
    }
    
    
    @IBAction func changePrice(sender: AnyObject) {
        
        var newPrice =  Int(silder_price.value)
        
        if newPrice > currentPrice {
            newPrice += ( 50 - newPrice%50)
            if newPrice > 200
            {newPrice = 200}
        }else
        if newPrice < currentPrice{
            newPrice = newPrice - newPrice%50
            if newPrice < 0
            {newPrice = 0}
        }
        
        silder_price.value = Float(newPrice)
        
        currentPrice = newPrice
        
        lbl_price.text = String(currentPrice)
    }
    
    //override method
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        silder_price.continuous = false
        view_tutorial.layer.zPosition = 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
}
