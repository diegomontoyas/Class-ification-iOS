//
//  ChallengeViewController.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController
{
    @IBOutlet weak var askToAnswerButton: UIButton!
    @IBOutlet weak var prizeLabel: UILabel!

    var challenge: Challenge!
    var timer: CircularTimer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        askToAnswerButton.clipsToBounds = true
        
        askToAnswerButton.setTitle("Pedir (-\(challenge.cost))", forState: UIControlState.Normal)
        prizeLabel.text = "+\(challenge.prize)"
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews()
    {
        askToAnswerButton.layer.cornerRadius = askToAnswerButton.frame.height/2
    }
    
    override func viewDidAppear(animated: Bool)
    {
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askToAnswerButtonPressed(sender: AnyObject)
    {
        system.askToAnswerChallenge()
        
        //Debería ser con delegate o notificación, sólo para pruebas por el momento
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.view.backgroundColor = UIColor(red: 154/255.0, green: 104/255.0, blue: 139/255.0, alpha: 1)
            self.prizeLabel.alpha = 0
            
        }) { (finished) -> Void in
            
            self.prizeLabel.hidden = true
            
            self.timer = CircularTimer(position: self.view.center, radius: 90, internalRadius: 0, circleStrokeColor: UIColor.grayColor(), activeCircleStrokeColor: UIColor.whiteColor(), initialDate: NSDate(), finalDate: NSDate().dateByAddingTimeInterval(5), startCallback: nil, endCallback: { () -> Void in
                
                self.finish()
            })
            
            self.timer.center = self.view.center
            
            self.view.addSubview(self.timer)
        }
        
    }
    
    func finish()
    {
        timer.hidden = true
        timer.stop()
        dismiss()
        
        system.presentPointsWon(challenge.prize)
    }
    
    func show()
    {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.view.frame = self.parentViewController!.view.frame
            
        }, completion: nil)
    }
    
    func dismiss()
    {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)
            
            }, completion: { (finished) -> Void in
                
                self.removeFromParentViewController()
                self.view.removeFromSuperview()
                self.didMoveToParentViewController(nil)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
