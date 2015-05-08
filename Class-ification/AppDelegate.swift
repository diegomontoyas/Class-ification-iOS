//
//  AppDelegate.swift
//  Class-ification
//
//  Created by Diego on 4/12/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func presentChallenge(challenge: Challenge)
    {
        let currentViewController = window!.rootViewController!
        
        let challengeViewController = currentViewController.storyboard!.instantiateViewControllerWithIdentifier("ChallengeViewController") as! ChallengeViewController
        
        challengeViewController.challenge = challenge
        
        challengeViewController.view.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height, challengeViewController.view.frame.width, challengeViewController.view.frame.height)
        currentViewController.addChildViewController(challengeViewController)
        currentViewController.view.addSubview(challengeViewController.view)
        challengeViewController.didMoveToParentViewController(currentViewController)
        
        challengeViewController.show()
    }
    
    func presentPointsWon(points: Int)
    {
        let currentViewController = window!.rootViewController!
        
        let youWonViewController = currentViewController.storyboard!.instantiateViewControllerWithIdentifier("YouWonViewController") as! YouWonViewController
        
        youWonViewController.points = points
        
        youWonViewController.view.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height, youWonViewController.view.frame.width, youWonViewController.view.frame.height)
        currentViewController.addChildViewController(youWonViewController)
        currentViewController.view.addSubview(youWonViewController.view)
        youWonViewController.didMoveToParentViewController(currentViewController)
        
        youWonViewController.show()
    }
    
    func presentQuestion(question: Question)
    {
        let currentViewController = window!.rootViewController!
        
        let questionViewController = currentViewController.storyboard!.instantiateViewControllerWithIdentifier("QuestionViewController") as! QuestionViewController
        
        questionViewController.question = question
        
        questionViewController.view.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height, questionViewController.view.frame.width, questionViewController.view.frame.height)
        currentViewController.addChildViewController(questionViewController)
        currentViewController.view.addSubview(questionViewController.view)
        questionViewController.didMoveToParentViewController(currentViewController)
        
        questionViewController.show()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

