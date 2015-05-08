//
//  HomePageViewController.swift
//  Class-ification
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class HomePageViewController: UIPageViewController, UIPageViewControllerDataSource
{
    var instantiatedViewControllers = [UIViewController]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dataSource = self
        
        automaticallyAdjustsScrollViewInsets = false
        
        let standingsViewController = storyboard?.instantiateViewControllerWithIdentifier("StandingsViewController") as! StandingsViewController
        standingsViewController.pageIndex = 0
        standingsViewController.view.frame = view.bounds
        
        let prizesViewController = storyboard?.instantiateViewControllerWithIdentifier("PrizesViewController") as! PrizesViewController
        prizesViewController.pageIndex = 1
        
        instantiatedViewControllers = [standingsViewController, prizesViewController]
        
        setViewControllers([standingsViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
   
        UIPageControl.appearance().backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        
    }
        
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let index = viewController.valueForKey("pageIndex") as! Int
        
        if index < instantiatedViewControllers.count-1
        {
            return instantiatedViewControllers[index+1]
        }
        else
        {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let index = viewController.valueForKey("pageIndex") as! Int

        if index > 0
        {
            return instantiatedViewControllers[index-1]
        }
        else
        {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return instantiatedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
