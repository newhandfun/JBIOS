//
//  PostData.swift
//  TestFB
//
//  Created by NHF on 2016/8/2.
//  Copyright © 2016年 NHF. All rights reserved.
//

import Foundation

public class PostData  {
    
    var param : String = ""
    
    public func doInBackground( ) -> NSString{
        var responseString : NSString = ""
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/login/test.php")!)
        request.HTTPMethod = "POST"
        let postString = param
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
            
        }
        task.resume()
        return responseString
    }
    
    func addParam(key:String,value:String){
        var str : String! = ""
        str = String(value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true))
        if param != ""{
            param += "&"
        }
        param = key + "=" + str

    }
    
    func addParam(key:String,value:Int){
        let str : String = String(String(value).dataUsingEncoding(NSUTF8StringEncoding,allowLossyConversion: true))
        if param != ""{
            param += "&"
        }
        param = key + "=" + str

    }
    
}
