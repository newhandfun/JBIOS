//
//  UserStruct.swift
//  TestFB
//
//  Created by NHF on 2016/9/15.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

struct StaticUserData {
    //app property
    static var photo : UIImage = UIImage()
    static var photoLarge : UIImage = UIImage();
    
    //
    static var userID : Int = 0
    static var exp :Int = 0
    static var coin : Int = 0
    static var lottery_ticket :Int = 0
    static var energy : Int = 0
    
    //
    static var name :String! = ""
    static var nickname : String! = ""
    static var email : String! = ""
    static var gender : String! = ""
   static  var password : String = ""
    
    //FB
    static var FBid : Int = 0
    static var isFB : Bool = false
    
    static func decodeJson(str : NSString!){
        do {
            if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
                // With value as Int
                if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:String] {
                    if json["email"] != nil{
                        StaticUserData.email = json["email"]!
                        StaticUserData.name = json["name"]!
                        StaticUserData.gender = json["gender"]!
                        StaticUserData.nickname = json["nickname"]!
                        StaticUserData.userID = Int((json["id"]! as String))!
                        StaticUserData.FBid = Int((json["FBid"]! as String))!
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
}
