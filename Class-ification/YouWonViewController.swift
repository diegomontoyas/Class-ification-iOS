//
//  YouWonViewController.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class YouWonViewController: UIViewController
{
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var youWonLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!

    var points = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        dismissButton.clipsToBounds = true
        dismissButton.layer.cornerRadius = 2
        
        youWonLabel.text = ((points >= 0) ? "¡Ganaste!":"¡Perdiste!")
        pointsLabel.text = ((points >= 0) ? "+\(points)":"\(points)")
        dismissButton.setTitle(((points >= 0) ? "Genial":"No tan genial"), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    @IBAction func dismissButtonPressed(sender: AnyObject)
    {
        dismiss()
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
