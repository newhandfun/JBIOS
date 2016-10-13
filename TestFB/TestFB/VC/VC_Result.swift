//
//  VC_Result.swift
//  TestFB
//
//  Created by NHF on 2016/8/22.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit
import MapKit

class VC_Result: VC_HasExtraMenu {
    
    @IBOutlet weak var txt_name : UITextField!
    @IBOutlet weak var img_store: UIImageView!
    @IBOutlet weak var btn_address: UIButton!
    @IBOutlet weak var btn_comment: UIButton!
    @IBOutlet weak var btn_phone: UIButton!
    @IBOutlet weak var btn_time: UIButton!
    @IBOutlet weak var mapKit_map: MKMapView!
    
    let UIRotation = CGFloat(M_PI)
    
    var imageTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_name.text = Store.name
        imageTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target : self, selector: Selector("loadImage"),userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        btn_phone.transform = CGAffineTransformMakeRotation(UIRotation)
        btn_time.transform = CGAffineTransformMakeRotation(UIRotation)
        btn_comment.transform = CGAffineTransformMakeRotation(UIRotation)
        btn_address.transform = CGAffineTransformMakeRotation(UIRotation)
        UIButton.animateWithDuration(0.7, animations: {
            self.btn_phone.transform = CGAffineTransformMakeRotation(0)
            self.btn_time.transform = CGAffineTransformMakeRotation(0)
            self.btn_comment.transform = CGAffineTransformMakeRotation(0)
            self.btn_address.transform = CGAffineTransformMakeRotation(0)
        })
    }
    
    func loadImage(){
        
        if Store.picImg == nil{
        NSURLSession.sharedSession().dataTaskWithURL(Store.picUrl!,completionHandler:
                {
                    (data, response, error) -> Void in
                    if error != nil {
                        print(error)
                        return
                    }else{
                        let image = UIImage(data: data!)
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            Store.picImg = image!
                            self.img_store.image = Store.picImg
                            self.imageTimer.invalidate()
                        })
                    }
            }).resume()
        }
        else{
            img_store.image = Store.picImg
        }
    }
    
    @IBAction func clickTimes(sender: AnyObject) {
        showMessage(Store.time, buttonText: "我知道了！")
    }
    
    @IBAction func clickPhone(sender: AnyObject) {
        print(Store.tel)
        showMessage(Store.tel, buttonText: "我知道了！")
    }
    
    @IBAction func clickAddress(sender: AnyObject) {
        showMessage(Store.address, buttonText: "我知道了！")
    }
    
    @IBAction func clickComment(sender: AnyObject) {
        goToDiscuss(sender)
    }
    
    func goToDiscuss(sender :AnyObject){
        NSURLSession.sharedSession().dataTaskWithRequest(
        Store.buildCommentReqest()) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let result = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            
            print("res = \(result)")
            
                //get comment
                Store.Discuss = StaticUserData.decodeJsonArray (result)
                self.performSegueWithIdentifier("Discuss", sender: sender)
            }
            .resume()
    }
    
    func showMessage(message:String!,buttonText:String!){
        let quetion = UIAlertController(title: nil, message: message, preferredStyle: .Alert);
        let callaction = UIAlertAction(title: buttonText, style: .Default , handler:nil);
        quetion.addAction(callaction);
        self.presentViewController(quetion, animated: true, completion: nil);
    }
    
    
}
