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
      
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if FBSDKAccessToken.currentAccessToken() != nil{
            goToMainSence()
        }
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
                    FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
                    self.getFBUserData()
                    //測試用
                    fbLoginManager.logOut()
                }else{
                    print("fail")
                    return
                }
            }
        })
    }
    func getFBUserData(){
        
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(normal),gender, email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    StaticUserData.name = result["name"] as? String
                    StaticUserData.email = result["email"] as? String
                    let FBid = result["id"] as? String
                    StaticUserData.FBid = Int(FBid!)!
                    StaticUserData.gender = result["gender"]as? String
                    StaticUserData.nickname = StaticUserData.name
                    StaticUserData.isFB = true
                    var pictureUrl = ""
                    
                    if let picture = result["picture"] as? NSDictionary,data = picture["data"] as? NSDictionary, url = data["url"] as? String {
                        pictureUrl = url
                    }
                    let url = NSURL(string: pictureUrl)
                    NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:
                        { (data, response, error) -> Void in
                            if error != nil {
                                print(error)
                                return
                            }else{
                                let image = UIImage(data: data!)
                                StaticUserData.photo = image!
                            }
                    }).resume()
                    let postData = PostData()
                    print(postData.LoginByFB())

                }
            })
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {}

    
    func goToMainSence(){
        performSegueWithIdentifier("Main", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
}
