//
//  PostData.swift
//  TestFB
//
//  Created by NHF on 2016/8/2.
//  Copyright © 2016年 NHF. All rights reserved.
//

import Foundation

public class PostData  {
    
//    let seccessString : String =  {"success":"False"}
    
    var param : String = ""
    var failString : NSString = "{\"success\":\"False\"}"
    var responseString : NSString = NSString()
    
    public func LoginByFB()->NSString{
        print(failString)
        failString = doInBackground(getFalse())
//        responseString = doInBackground(haveFBaccount())
        if responseString == failString{
//            responseString = doInBackground(loadUser())
//            return responseString
//            print("!")
        }
//        responseString = doInBackground(addFBUser())
        return responseString
    }
    
    public func doInBackground( request : NSMutableURLRequest) -> NSString{
        var responseString : NSString = ""
        let postString = param
        print(postString)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            print("responseString = \(responseString)")
            
            StaticUserData.decodeJson(responseString)
        }
        task.resume()
        return responseString
    }
    
    func getFalse()->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/login/addFBUser.php")!)
        request.HTTPMethod = "POST"
        param = ""
        return request
    }
    
    func addFBUser()->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/login/addFBUser.php")!)
        request.HTTPMethod = "POST"
        param = ""
        addParam("hash", value: "This is Ivan Speaking.")
        addParam("name", value: StaticUserData.name)
        addParam("gender", value: StaticUserData.gender)
        addParam("nickname", value: StaticUserData.name)
        addParam("email", value: StaticUserData.email)
        addParam("FBid", value: StaticUserData.FBid)
        return request
    }
    
    func loadUser()->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/login/loadUser.php")!)
        request.HTTPMethod = "POST"
        param = ""
        addParam("hash", value: "This is Ivan Speaking.")
        addParam("email", value: StaticUserData.email)
        return request
    }
    
    func haveFBaccount()->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/login/haveFBaccount.php")!)
        request.HTTPMethod = "POST"
        param = ""
        addParam("hash", value: "This is Ivan Speaking.")
        addParam("email", value: StaticUserData.email)
        addParam("FBid", value: StaticUserData.FBid)
        return request
    }
    
    func addParam(key:String,value:String){
//        var str : String! = ""
//        str = String(value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true))
        let str = String(UTF8String: value.cStringUsingEncoding(NSUTF8StringEncoding)!)
        if param != ""{
            param += "&"
        }
        param += (key + "=" + str!)

    }
    
    func addParam(key:String,value:Int){
        var str = String(value)
        str = String(UTF8String: str.cStringUsingEncoding(NSUTF8StringEncoding)!)!
        if param != ""{
            param += "&"
        }
        param += (key + "=" + str)

    }
    
}
