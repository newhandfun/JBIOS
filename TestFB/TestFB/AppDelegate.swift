  //
//  AppDelegate.swift
//  TestFB
//
//  Created by NHF on 2016/7/31.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        var initialViewController: UIViewController
        
        if(FBSDKAccessToken.currentAccessToken() != nil){
            
            //user
            let user :User = User()
            var parameters = ["fields": "id, name, first_name, last_name, picture.type(large), email"]
            
            FBSDKGraphRequest(graphPath: "me", parameters:parameters).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    user.FBid = parameters["id"]
                    user.name = parameters["name"]
                    user.email = parameters["email"]
                }
            })
            
            let vc = mainStoryboard.instantiateViewControllerWithIdentifier("Main") as! VC_MainSence
            vc.user = user
            initialViewController = vc
        }else{
            initialViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Login")
        }
        
        self.window?.rootViewController = initialViewController
        
        self.window?.makeKeyAndVisible()
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func application(application :UIApplication,openURL url:NSURL,sourceApplication : String?,annotation : AnyObject)->Bool{
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation:annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

