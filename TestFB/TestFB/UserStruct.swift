//
//  UserStruct.swift
//  TestFB
//
//  Created by NHF on 2016/9/15.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

struct StaticUserData {
    //FB parameters
    static let parameters = ["fields": "id, name, first_name, last_name, picture.type(normal),gender, email"]
    
    
    //app property
    static var photo : UIImage = UIImage()
    static var photoLarge : UIImage = UIImage();
    
    //
    static var userID : Int?
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
    
    static func convertFBResultToProperty(result:AnyObject!,function:()){
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
        print(url)
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:
            { (data, response, error) -> Void in
                if error != nil {
                    print(error)
                    return
                }else{
                    let image = UIImage(data: data!)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        StaticUserData.photo = image!
                    })
                }
                let postData = PostData()
                postData.LoginFBInBackground(function)
        }).resume()
    }
    
    static func decodeJsonToUserData(str : NSString!){
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
                        print("FB->UserDataSecc")
                    }
                }
            }
        } catch {
            print("FB->UserData" + "\(error)")
            return
        }
    }
    
    static func decodeJson(str:NSString)->[String:String]{
        var json:[String:String] = [String:String]()
        do {
            if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
                // With value as Int
                json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:String]
            }
            return json
        } catch {
            print(error)
            print("資料抓不成功")
        }
        return json
    }
    
    static func encodeJson(){
    }
    
    static func decodeJsonArray(str : NSString)->[[String:String]]?{
        var json : [[String:String]]
        do{
            if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! [[String: String]]
                return json
            }else{
                return nil
            }
        }catch{
            print(error)
            print("陣列抓不成功")
        }
        print("")
        return nil
    }
    
    
    static func addParam(orgin:String,key:String,value:String)->String{
        var new = orgin
        let str = String(UTF8String: value.cStringUsingEncoding(NSUTF8StringEncoding)!)
        if(new != ""){
            new += "&"
        }
        new += (key + "=" + str!)
        return new
    }
    
    static func addParam(orgin:String,key:String,value:Int) -> String{
        var new = orgin
        var str = String(value)
        str = String(UTF8String: str.cStringUsingEncoding(NSUTF8StringEncoding)!)!
        if(new != ""){new += "&"}
        new += (key + "=" + str)
        return new
    }
    
}
