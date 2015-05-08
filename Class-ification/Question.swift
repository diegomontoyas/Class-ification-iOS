//
//  Question.swift
//  Class-ification
//
//  Created by Diego on 5/5/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class Question: NSObject
{
    var question = ""
    var answers = [String]()
    
    init (question:String, answers:[String])
    {
        self.question = question
        self.answers = answers
    }
}
