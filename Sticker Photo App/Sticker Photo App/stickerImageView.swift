//
//  stickerImageView.swift
//  Sticker Photo App
//
//  Created by Edrick Pascual on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class stickerImageView: UIImageView {

	var viewController: UIViewController?
	
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
	override init(image: UIImage?) {
		super.init(image: image)
		self.userInteractionEnabled = true
		
		let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
		self.addGestureRecognizer(pan)
    }
	
//	convenience init(image: UIImage?, withViewController viewController: UIViewController? = nil) {
//		
//		if let viewController = viewController {
//			self.viewController = viewController
//			viewController.view.addSubview(self)
//		}
//		
//		self.init(image: image)
//		
//		self.userInteractionEnabled = true
//	}

	func handlePan(panGestureRecognizer: UIPanGestureRecognizer!) {
		if panGestureRecognizer.state == .Began || panGestureRecognizer.state == .Changed {
			let translation = panGestureRecognizer.translationInView(panGestureRecognizer.view) // Get the spot it is now
			
			if let view = panGestureRecognizer.view {
				let affinerTransformTranslate = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
				view.transform = affinerTransformTranslate
				panGestureRecognizer.setTranslation(CGPointZero, inView: view)
			} else {
				print("No View")
			}
		}
	}
	
}
