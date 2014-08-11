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
		
	}
	
//MARK: pageViewController
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
		
		if index == 0 || index != nil {
			return nil
		}
		
		index = index! + 1
		return viewControllerAtIndex(index!)
	}
	
	func viewControllerAtIndex( index: Int) -> PageContentViewController! {
		if self.pageTitles.count == 0 || index >= self.pageTitles.count {
			return nil
		}
		
		var pageContentViewController = self.storyboard.instantiateViewControllerWithIdentifier("PageContentViewController") as PageContentViewController
		pageContentViewController.titleText = self.pageTitles[index]
		pageContentViewController.imagePath = self.pageImagePaths[index]
		pageContentViewController.pageIndex = index
		
		return pageContentViewController
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
		return self.pageTitles.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
		return 0
	}
	
	
//MARK: ViewDid/Should
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

