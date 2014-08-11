//
//  ViewController.swift
//  UIPageViewControllerExample
//
//  Created by Leonardo Lee on 8/11/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
	
	//Initialize a UIPageViewController object.
	var pageViewController = UIPageViewController()
	var pageTitles = [ "Over 200 Tips and Tricks", "Discover Hidden Features", "Bookmark Favorite Tip", "Free Regular Update" ]
	var pageImagePaths = [ "page1.png", "page2.png", "page3.png", "page4.png" ]
	
	//IBAction to start the tutorial UIPageVC.
	@IBAction func startWalkthrough(sender: AnyObject) {
		var startingController = self.viewControllerAtIndex(0)
		var viewControllers = [startingController]
		self.pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
		
	}
	
//MARK: UIPageViewControllerDataSource
	func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
		
		var currentVC = viewController as PageContentViewController
		var index = currentVC.pageIndex
		
		if index == 0 || index != nil {
			return nil
		}
		
		index = index! - 1
		return viewControllerAtIndex(index!)
		
	}
	
	func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {

		var currentVC = viewController as PageContentViewController
		var index = currentVC.pageIndex
		
		if index == nil {
		println("returning nil")
			return nil
		}
		index = index! + 1
		
		if index == self.pageTitles.count {
			return nil
		}
		
		return viewControllerAtIndex(index!)
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
		return self.pageTitles.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
		return 0
	}
	
	//Used to generate the ViewControllers at the Index.
	func viewControllerAtIndex( index: Int) -> PageContentViewController! {
		if self.pageTitles.count == 0 || index >= self.pageTitles.count {
			return nil
		}
		
		var pageContentViewController = self.storyboard.instantiateViewControllerWithIdentifier("PageContentController") as PageContentViewController
		pageContentViewController.titleText = self.pageTitles[index]
		pageContentViewController.imagePath = self.pageImagePaths[index]
		pageContentViewController.pageIndex = index
		
		return pageContentViewController
	}
	
	
//MARK: ViewDid/Should methods
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.pageViewController = self.storyboard.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
		self.pageViewController.dataSource = self
		
		var startingViewController = self.viewControllerAtIndex(0) as PageContentViewController
		var viewControllers = [startingViewController] as NSArray
		self.pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
		
		//Size of the VC
		self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)
		
		self.addChildViewController(pageViewController)
		self.view.addSubview(pageViewController.view)
		self.pageViewController.didMoveToParentViewController(self)
		
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
}

