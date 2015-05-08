//
//  QuestionViewController.swift
//  Class-ification
//
//  Created by Diego on 5/2/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    
    var question: Question!
    
    let abc = ["A","B","C","D","E"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        answersTableView.dataSource = self
        answersTableView.delegate = self
        
        questionLabel.text = question.question
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return question.answers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = answersTableView.dequeueReusableCellWithIdentifier("MultipleChoiceAnswerTableViewCell") as! MultipleChoiceAnswerTableViewCell
        
        cell.letterLabel.text = abc[indexPath.row]
        cell.answerLabel.text = question.answers[indexPath.row]
        
        return cell
    }

    override func didReceiveMemoryWarning()
    {
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        dismiss()
        system.presentPointsWon(0)
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
