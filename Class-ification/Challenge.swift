//
//  Challenge.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class Challenge: NSObject
{
    var cost = 0
    var prize = 0
    
    init(cost:Int, prize:Int)
    {
        self.cost = cost
        self.prize = prize
    }
}
