//
//  User.swift
//  TestFB
//
//  Created by NHF on 2016/8/25.
//  Copyright © 2016年 NHF. All rights reserved.
//

import Foundation


public class User{
    
    //
    var userID : Int = 0
    var exp :Int = 0
    var coin : Int = 0
    var lottery_ticket :Int = 0
    var energy : Int = 0
    
    //
    var name :String! = ""
    var nickname : String! = ""
    var email : String! = ""
    var gender : String! = ""
    var password : String = ""
    
    //FB
    var FBid = ""
    var isFB : Bool = false
    
    public init(){
    }
    
    public var UserID : Int{
        get{return userID}
        set{userID = newValue}
    }
    
    public var Exp : Int{
        get{return coin}
        set{coin = newValue}
    }
    
    public var Lottery_ticket : Int{
        get{return lottery_ticket}
        set{lottery_ticket = newValue}
    }
    
    public var Energy : Int{
        get{return energy}
        set{energy = newValue}
    }
    
    public var Name : String{
        get{return name}
        set{name = newValue}
    }
    
    public var Nickname : String{
        get{return nickname}
        set{nickname = newValue}
    }
    
    public var  Email: String{
        get{return email}
        set{gender = newValue}
    }
    
    public var Password : String{
        get{return password}
        set{password = newValue}
    }
    
    public var  Gender: String{
        get{return gender}
        set{gender = newValue}
    }
    
    public var FBID : String{
        get{return FBid}
        set{FBid = newValue}
    }
    
    public var IsFB : Bool{
        get{return isFB}
        set{isFB = newValue}
    }
    
    public func encodeToJson() -> String{
        var JSData:String = ""
        
//        do {
//            JSData = try NSJSONSerialization.dataWithJSONObject(self, options: NSJSONReadingOptions()) as String!
//            
//        } catch {
//            print(error)
//        }
        
        return JSData
    }
}