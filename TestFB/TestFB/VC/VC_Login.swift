//
//  VC_Login.swift
//  TestFB
//
//  Created by NHF on 2016/8/31.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

class VC_Login: VC_BaseVC,FBSDKLoginButtonDelegate{
    
    var isLogin : Bool  = false;
    @IBOutlet weak var btn_FBLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let fb = btn_FBLogin as? FBSDKLoginButton{
////            print("0")
//            fb.readPermissions = ["email","user_friends","public_profile"]
//            if FBSDKAccessToken.currentAccessToken() != nil{
//                goToMainSence()
//            }
//        }
//        getFBUserData()
//        goToMainSence()
//      btn_FBLogin.setValue("已登入！", forKey: "")
    }
    
    //登入
    @IBOutlet weak var text_emil: UITextField!
    @IBOutlet weak var text_password: UITextField!
    
    func checkInput()->Bool{
        return true
    }
    
    @IBAction func click_Login(sender: AnyObject) {
        if checkInput(){
            goToMainSence()
        }
    }
    
    @IBAction func clickFBLogin(sender: AnyObject) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager .logInWithReadPermissions(["email","user_friends","public_profile"],fromViewController: self,  handler:  { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if(fbloginresult.grantedPermissions.contains("email") )
                {
                    self.getFBUserData()
                    fbLoginManager.logOut()
                }else{
                    return
                }
            }
        })
    }
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                }
            })
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {}

    
    func goToMainSence(){
//        if(isLogin != false){
            performSegueWithIdentifier("Main", sender: self)
//        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
}
