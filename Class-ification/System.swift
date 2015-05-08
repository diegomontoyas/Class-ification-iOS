//
//  System.swift
//  Class-ification
//
//  Created by Diego on 4/14/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

let system = System()

class System: NSObject, GCDAsyncSocketDelegate
{
    var socket: GCDAsyncSocket!
    
    var myPoints = 304
    var classPoints = [40,30,130,123,132,304,120,450,49,70,150]
    var prizes = [Prize(cost: 150, priceDescription: "+0.5 Quiz"), Prize(cost: 180, priceDescription: "Reto +300"), Prize(cost: 400, priceDescription: "+0.2 parcial")]
    
    var currentChallenge: Challenge?

    override init()
    {
        super.init()
        
        socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        
        var error:NSError?
        let connected = socket.connectToHost("192.168.0.14", onPort: UInt16(8484), error: &error)
        
        socket.readDataToData("\n".dataUsingEncoding(NSUTF8StringEncoding), withTimeout: -1, tag: 0)
        
        classPoints.sort
        {
            return $0 < $1
        }
        
        prizes.sort
        {
            return $0.cost < $1.cost
        }
    }
    
    func presentChallenge(challenge:Challenge)
    {
        (UIApplication.sharedApplication().delegate! as! AppDelegate).presentChallenge(challenge)
    }
    
    func presentPointsWon(points:Int)
    {
        (UIApplication.sharedApplication().delegate! as! AppDelegate).presentPointsWon(points)
    }
    
    func presentQuestion(question:Question)
    {
        (UIApplication.sharedApplication().delegate! as! AppDelegate).presentQuestion(question)
    }
    
    func askToAnswerChallenge()
    {
        
    }
    
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int)
    {
        var serverSays = NSString(data: data, encoding: NSUTF8StringEncoding)! as String
        serverSays = serverSays.stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        if serverSays.rangeOfString("CHALLENGE") != nil
        {
            let components = split(serverSays) {$0 == ":"}
            
            presentChallenge(Challenge(cost: components[1].toInt()!, prize: components[2].toInt()!))
        }
        else if serverSays.rangeOfString("QUESTION") != nil
        {
            let components = split(serverSays) {$0 == ":"}
            
            presentQuestion(Question(question: components[1], answers: Array(components[2..<components.count])))
        }
        
        socket.readDataWithTimeout(-1, tag: 0)
    }
}
