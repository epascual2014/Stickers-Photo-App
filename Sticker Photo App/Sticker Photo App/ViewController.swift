//
//  ViewController.swift
//  Sticker Photo App
//
//  Created by Edrick Pascual on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stickersArray = [stickerImageView]()
	
	enum StickerName: Int {
		case Eyeglasses = 2
		case Mustache = 3
		case Hat = 4
		case Done = 5
		case Activity = 1
	}
	
	var photoTakingHelper: PhotoTakingHelper!
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var imageCaptureButton: UIButton!
	@IBOutlet weak var toolbar: UIToolbar!
	@IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func getImageTapped(sender: AnyObject) {
		takePhoto()
    }
	
	//MARK: Toolbar Buttons
    @IBAction func stickerTapped(sender: UIBarButtonItem) {
		
        let toolBarButtons = StickerName(rawValue: sender.tag)!
		
        switch toolBarButtons {
        case .Eyeglasses:
            eyeglasses(sender)
        case .Mustache:
            mustache(sender)
        case .Hat:
            hat(sender)
        case .Done:
            done(sender)
		case .Activity:
			showActivityController(sender)
        }
    }

	func eyeglasses(sender: UIBarButtonItem) {
		if imageView.image != nil {
			let eyeglassSticker = stickerImageView(image: UIImage(named: "eyeglasses1"))
			eyeglassSticker.frame.origin = CGPoint(x: 50, y: 200)
			self.view.addSubview(eyeglassSticker)
			stickersArray.append(eyeglassSticker)
			// desable button after user
			if sender.tag == 2 {
				sender.enabled = false
			}
		}
    }
	
    func mustache(sender: UIBarButtonItem){
		if imageView.image != nil {
			let mustacheSticker = stickerImageView(image: UIImage(named: "mustache3"))
			mustacheSticker.frame.origin = CGPoint(x: 50, y: 50)
			self.view.addSubview(mustacheSticker)
			stickersArray.append(mustacheSticker)
			// desable mustache button after user
			if sender.tag == 3 {
				sender.enabled = false
			}
		}
	}
	
    func hat(sender: UIBarButtonItem){
		if imageView.image != nil {
			let hatSticker = stickerImageView(image: UIImage(named: "hat1"))
			hatSticker.frame.origin = CGPoint(x: 50, y: 50)
			//array.append(nameofarray)
			self.view.addSubview(hatSticker)
			stickersArray.append(hatSticker)
			
			// desable hat button after user
			if sender.tag == 4 {
				sender.enabled = false
			}
		}
    }
    
	func done(sender: UIBarButtonItem){
		if imageView.image != nil {
			guard let barButtonIndex = toolbar.items?.indexOf(sender) else { return }
			let actionBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(self.stickerTapped(_:)))
			actionBarButtonItem.tag = 1
			toolbar.items![barButtonIndex] = actionBarButtonItem
			
			disableStickers()
		}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	func takePhoto() {
		photoTakingHelper = PhotoTakingHelper(viewController: self) { (image: UIImage?) in
			if let image = image {
				self.imageView.image = image
				self.toolbar.hidden = false
				self.imageCaptureButton.hidden = true
			}
		}
	}
	
	func hideStickers() {
		for sticker in stickersArray {
			sticker.hidden = true
		}
	}
	
	func disableStickers() {
		for sticker in stickersArray {
			sticker.userInteractionEnabled = false
		}
	}
	
	func resetState() {
		imageCaptureButton.hidden = false
		imageView.image = nil
		toolbar.items![1].enabled = true
		toolbar.items![3].enabled = true
		toolbar.items![5].enabled = true
	}
	
	func showActivityController(sender: UIBarButtonItem) {
		toolbar.hidden = true
		imageView.image = photoTakingHelper.takeScreeShot(self.view!)
		hideStickers()
		toolbar.hidden = false
		let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
		activityController.popoverPresentationController?.barButtonItem = sender
		activityController.completionWithItemsHandler = { (activity: String?, success: Bool, objectsToShare: [AnyObject]?, error: NSError?) in
			print("activity \(activity), success \(success), \(objectsToShare), error \(error)")
			
			if !success {
				self.resetState()
			}
		}
		presentViewController(activityController, animated: true, completion: nil)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}














