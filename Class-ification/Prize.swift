//
//  Prize.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class Prize: NSObject
{
    var cost = 0
    var priceDescription = ""
    
    init(cost:Int, priceDescription:String)
    {
        self.cost = cost
        self.priceDescription = priceDescription
    }
}
