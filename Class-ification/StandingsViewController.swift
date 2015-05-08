//
//  ViewController.swift
//  Class-ification
//
//  Created by Diego on 4/12/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit
//import Charts

class StandingsViewController: UIViewController, GKBarGraphDataSource
{
    var pageIndex = (-1)
    
    //@IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var barChart: GKBarGraph!
    @IBOutlet weak var myPointsLabel: UILabel!
    @IBOutlet weak var myPositionLabel: UILabel!
    
    let barSpacing:CGFloat = 1.0
    var maxPoints = 0
    var myPointsAppeared = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        barChart.dataSource = self
        barChart.marginBar = barSpacing
        barChart.backgroundColor = UIColor.clearColor()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        for points in system.classPoints
        {
            if points > maxPoints
            {
                maxPoints = points
            }
        }
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        barChart.reset()
    }
    
    override func viewDidAppear(animated: Bool)
    {        
        myPointsAppeared = false
        let barCount = CGFloat(system.classPoints.count)
        barChart.barWidth = barChart.bounds.width/barCount - barSpacing*barCount/2
        barChart.barHeight = view.frame.height/3.0
        barChart.draw()
    }
    
    func numberOfBars() -> Int
    {
        return system.classPoints.count
    }
    
    func valueForBarAtIndex(index: Int) -> NSNumber!
    {
        return (Float(system.classPoints[index])/Float(maxPoints))*100.0
    }
    
    func titleForBarAtIndex(index: Int) -> String!
    {
        return index == system.classPoints.count-1 ? system.classPoints[index].description:nil
    }
    
    func colorForBarAtIndex(index: Int) -> UIColor!
    {
        let points = system.classPoints[index]
        
        if points == system.myPoints
        {
            //My Points
            
            myPositionLabel.text = (system.classPoints.count-index).description
            myPointsLabel.text = points.description
            myPointsAppeared = true
            return UIColor.orangeColor()
        }
        else
        {
            return UIColor.lightGrayColor()
        }
    }
    
    func colorForBarBackgroundAtIndex(index: Int) -> UIColor!
    {
        return UIColor.clearColor()
    }
    
    func animationDurationForBarAtIndex(index: Int) -> CFTimeInterval
    {
        return CFTimeInterval(1/CGFloat(Int.random(1...2)))
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

extension Int
{
    static func random(range: Range<Int> ) -> Int
    {
        var offset = 0
        
        if range.startIndex < 0   // allow negative ranges
        {
            offset = abs(range.startIndex)
        }
        
        let mini = UInt32(range.startIndex + offset)
        let maxi = UInt32(range.endIndex   + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}
