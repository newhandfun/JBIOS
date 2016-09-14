//
//  VC_ExtraOption.swift
//  TestFB
//
//  Created by NHF on 2016/8/21.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit


class VC_ExtraOption: VC_BaseVC {
    
    //component
    @IBOutlet var view_base: UIView!
    @IBOutlet weak var btn_bell: UIButton!
    @IBOutlet weak var view_sign: UIView!
    
    //get parent VC
    var parent : VC_HasExtraMenu = VC_HasExtraMenu()
    
    internal var extraViewDistance : CGFloat{
        get{
//            return view_base.bounds.width - btn_bell.bounds.width
            return view_sign.bounds.width + 20
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        initialSelf()
    }
    
    func initialSelf() {
        if let _main = self.parentViewController{
            parent = _main as! VC_HasExtraMenu
            parent.extraViewDistance = self.extraViewDistance
        }
        
        setAnchor(CGPointMake(0.5,0), btn: btn_bell)
        setAnchor(CGPointMake(0.5,0), view: view_sign)
        
        if parent.isClose {
            parent.closeExtraView(0)
        }
    }
    
    
    @IBAction func clickBellButton(sender: AnyObject) {
        if !parent.isClose {
            parent.closeExtraView(0.5)
            bellSwing(0.5,rotaion: 1)
            signSwing(0.5,rotaion: 0.5)
            bellSwing(1.2,rotaion: 0)
            signSwing(1,rotaion: 0)
        }
        else{
            parent.openExtraView(0.5)
            bellSwing(0.2,rotaion: -1)
            signSwing(0.2,rotaion: -0.5)
            bellSwing(0.4,rotaion: 0)
            signSwing(0.4,rotaion: 0)
        }
    }
    
    func bellSwing(time:NSTimeInterval,rotaion : CGFloat){
        
        UIButton.animateWithDuration(time, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations:
            {
                self.btn_bell.transform = CGAffineTransformMakeRotation(rotaion)
            }, completion: nil)

    }
    
    func signSwing(time:NSTimeInterval,rotaion : CGFloat){
        UIView.animateWithDuration(time, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations:
            {
                self.view_sign.transform = CGAffineTransformMakeRotation(rotaion)
            }, completion: nil)
    }
    
    
    func setAnchor(anchorPoint : CGPoint, btn : UIButton){
        var newPoint = CGPointMake(btn.bounds.size.width * anchorPoint.x, btn.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(btn.bounds.size.width * btn.layer.anchorPoint.x, btn.bounds.size.height * btn.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, btn.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, btn.transform)
        
        var position : CGPoint = btn.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        btn.layer.position = position;
        btn.layer.anchorPoint = anchorPoint;
    }
    
    func setAnchor(anchorPoint : CGPoint,view:UIView) {
        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
        
        var position : CGPoint = view.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        view.layer.position = position;
        view.layer.anchorPoint = anchorPoint;
    }
}
