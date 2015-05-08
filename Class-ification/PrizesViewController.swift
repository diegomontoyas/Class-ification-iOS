//
//  PrizesViewController.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class PrizesViewController: UIViewController, GKBarGraphDataSource
{
    var pageIndex = 0
    
    var prizesLabels = [UILabel]()
    
    @IBOutlet weak var myPointsBarChart: GKBarGraph!
    
    let barSpacing:CGFloat = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()

        myPointsBarChart.dataSource = self
        myPointsBarChart.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        removePrizes()
        
        myPointsBarChart.reset()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
                
        myPointsBarChart.marginBar = 0
        myPointsBarChart.barWidth = myPointsBarChart.bounds.width
        myPointsBarChart.barHeight = myPointsBarChart.bounds.height
        myPointsBarChart.draw()
        
        drawPrizes()
    }
    
    func numberOfBars() -> Int
    {
        return 1
    }
    
    func valueForBarAtIndex(index: Int) -> NSNumber!
    {
        return Float(system.myPoints)/Float(system.prizes.last!.cost)*100
    }
    
    func titleForBarAtIndex(index: Int) -> String!
    {
        return index == system.classPoints.count-1 ? system.classPoints[index].description:nil
    }
    
    func colorForBarBackgroundAtIndex(index: Int) -> UIColor!
    {
        return UIColor.clearColor()
    }
    
    func removePrizes()
    {
        for label in prizesLabels
        {
            label.removeFromSuperview()
        }
        
        prizesLabels = []
    }

    func drawPrizes()
    {
        let prizes = system.prizes
        let bezierPath = UIBezierPath()
        
        for prize in prizes
        {
            let y = CGFloat(prize.cost)*(view.bounds.height-50.0)/CGFloat(prizes.last!.cost)
            
            bezierPath.moveToPoint(CGPointMake(0, view.bounds.height-y))
            bezierPath.addLineToPoint(CGPointMake(view.bounds.width, view.bounds.height-y))
            
            var shapeLayer = CAShapeLayer()
            shapeLayer.path = bezierPath.CGPath
            shapeLayer.strokeColor = UIColor.lightGrayColor().CGColor
            shapeLayer.lineWidth = 0.5
            
            view.layer.insertSublayer(shapeLayer, atIndex: 0)
            
            let prizeCostLabel = UILabel(frame: CGRectMake(myPointsBarChart.bounds.width + 20, view.bounds.height-y-20, 60, 20))
            prizeCostLabel.text = prize.cost.description
            prizeCostLabel.font = UIFont(name: "Heiti SC Light", size: 11)
            prizeCostLabel.textColor = UIColor.whiteColor()
            prizeCostLabel.alpha = 0
            
            let prizeDescriptionLabelXOrigin = myPointsBarChart.bounds.width + prizeCostLabel.bounds.width + 30
            
            let prizeDescriptionLabel = UILabel(frame: CGRectMake(prizeDescriptionLabelXOrigin, view.bounds.height-y-20, view.bounds.width - prizeDescriptionLabelXOrigin - 30, 20))
            prizeDescriptionLabel.text = prize.priceDescription
            prizeDescriptionLabel.textAlignment = NSTextAlignment.Right
            prizeDescriptionLabel.font = UIFont(name: "Heiti SC Light", size: 11)
            prizeDescriptionLabel.textColor = UIColor.whiteColor()
            prizeDescriptionLabel.alpha = 0

            prizesLabels.append(prizeCostLabel)
            prizesLabels.append(prizeDescriptionLabel)
            
            view.addSubview(prizeCostLabel)
            view.addSubview(prizeDescriptionLabel)
            
            UIView.animateWithDuration(0.4, delay: 1, options: nil, animations: { () -> Void in
                
                prizeCostLabel.alpha = 1
                prizeDescriptionLabel.alpha = 1
                
            }, completion: nil)
        }
    }
}
