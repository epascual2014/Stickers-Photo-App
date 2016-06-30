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
    
    @IBAction func getImageTapped(sender: AnyObject) {
		takePhoto()
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
	
	func showActivityController(sender: UIBarButtonItem) {
		let activityItems = [imageView.image!]
		let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
		activityController.popoverPresentationController?.barButtonItem = sender
		presentViewController(activityController, animated: true, completion: nil)
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
            done()
		case .Activity:
			showActivityController(sender)
        }
    }

	func eyeglasses(sender: UIBarButtonItem) {
        print(#function)
        let eyeglassSticker = stickerImageView(image: UIImage(named: "eyeglasses1"))
        eyeglassSticker.frame.origin = CGPoint(x: 50, y: 200)
        self.view.addSubview(eyeglassSticker)
        stickersArray.append(eyeglassSticker)
		
		// desable button after user
		if sender.tag == 2 {
			sender.enabled = false
		}
    }
	
    func mustache(sender: UIBarButtonItem){
        print(#function)
        let mustacheSticker = stickerImageView(image: UIImage(named: "mustache3"))
        mustacheSticker.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(mustacheSticker)
        stickersArray.append(mustacheSticker)
		
		// desable mustache button after user
		if sender.tag == 3 {
			sender.enabled = false
		}
	}
	
    func hat(sender: UIBarButtonItem){
        print(#function)
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
    
    func done(){
        print(#function)
        for sticker in stickersArray {
            sticker.userInteractionEnabled = false
            self.toolbar.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}














