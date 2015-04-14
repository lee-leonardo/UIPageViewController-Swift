//
//  PageContentViewController.swift
//  UIPageViewControllerExample
//
//  Created by Leonardo Lee on 8/11/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
	
	//To have a label for a childVC and a background image for the child VC.
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var backgroundImageView: UIImageView!
	
	//Variables to make a Page Content View Controller work.
	var pageIndex : Int?
	var titleText : String?
	var imagePath : String?
	
	override func viewDidLoad() {
		self.backgroundImageView.image = UIImage(named: self.imagePath!)
		self.titleLabel.text = self.titleText
	}

}
