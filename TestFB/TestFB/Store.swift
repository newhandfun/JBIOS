//
//  Store.swift
//  TestFB
//
//  Created by NHF on 2016/9/24.
//  Copyright © 2016年 NHF. All rights reserved.
//

import UIKit

struct Store {
    static var id : Int?
    static var name : String! = ""
    static var address : String?
    static var time : String?
    static var tel : String?
    static var picUrl : NSURL?
    static var picImg :UIImage?
    
    static var Discuss : [[String:String]]?
    
    static func getStoreFromSever(tag : Int,price :Int,doAfterAll : ()){
        
    }

    static func buildReqest(tag:Int,price:Int)->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/Menu/getStore.php")!);
        request.HTTPMethod = "POST"
        var str = StaticUserData.addParam("",key: "hash", value: "This is Ivan Speaking.")
        str = StaticUserData.addParam(str,key: "option2", value: tag)
        str = StaticUserData.addParam(str,key: "option4", value: price)
        request.HTTPBody = str.dataUsingEncoding(NSUTF8StringEncoding)
        print("get store = " + str)
//        print(str)
        return request
    }
    
    static func buildCommentReqest()->NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: NSURL(string: "http://140.122.184.227/~ivan/JB/Comment/getComment.php")!);
        request.HTTPMethod = "POST"
        if(id != nil){
        let idToString = String(id!)
        let str = "hash=This is Ivan Speaking.&storeID=16"
            //+ idToString
        request.HTTPBody = str.dataUsingEncoding(NSUTF8StringEncoding)
            print("shop comment request = " + str )
        }else{
            print("沒店家資訊")
        }
        return request
    }
    
}
