//
//  VC_Login.swift
//  TestFB
//
//  Created by NHF on 2016/8/31.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Login: VC_BaseVC,FBSDKLoginButtonDelegate{
    
    var isLogin : Bool  = false
    @IBOutlet weak var btn_FBLogin: UIButton!
    var loginTimer = NSTimer()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if FBSDKAccessToken.currentAccessToken() != nil{
            CallActivityIndicator("臉書登入中～請稍候");
            getFBUserData()
            loginTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("goToMainSence"),userInfo: nil, repeats: true)
        }
    }
    
    //登入
    //UI
    @IBOutlet weak var text_emil: UITextField!
    @IBOutlet weak var text_password: UITextField!
    
    //事件
    @IBAction func click_Login(sender: AnyObject) {

    }
    @IBAction func clickFBLogin(sender: AnyObject) {
        FBLogin()
    }
    //FBLogin
    func FBLogin(){
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager .logInWithReadPermissions(["email","user_friends","public_profile"],fromViewController: self,  handler:  { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
            if(fbloginresult.grantedPermissions.contains("email") )
                {
                    FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
                    self.getFBUserData()
                }else{
                    print("fail")
                    return
                }
            }
        })
    }
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: StaticUserData.parameters).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    StaticUserData.convertFBResultToProperty(result,function : self.goToMainSence())
                    print("login")
                }
            })
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {}

    
    func goToMainSence(){
        CencleActivityIndicator()
        if(StaticUserData.userID != nil){
            performSegueWithIdentifier("Main", sender: self)
            loginTimer.invalidate()
        }else{
            showMessage("請檢查網路狀態～", buttonText: "我知道了")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
}
