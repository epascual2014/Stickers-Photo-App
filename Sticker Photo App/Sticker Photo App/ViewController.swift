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
    
    enum StickerName: String {
        case Eyeglasses = "1"
        case Mustache = "2"
        case Hat = "3"
        case Done = "DONE"
        
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
	
	//MARK: Toolbar Buttons
    
    @IBAction func stickerTapped(sender: UIBarButtonItem) {

        let toolBarButtons = StickerName(rawValue: sender.title!)!
        
        switch toolBarButtons {
        case .Eyeglasses:
            eyeglasses()
        case .Mustache:
            mustache()
        case .Hat:
            hat()
        case .Done:
            done()
        }
    }

    func eyeglasses() {
        print(#function)
        let eyeglassSticker = stickerImageView(image: UIImage(named: "eyeglasses1"))
        eyeglassSticker.frame.origin = CGPoint(x: 50, y: 200)
        self.view.addSubview(eyeglassSticker)
        stickersArray.append(eyeglassSticker)
        
        let eyeglassArray = toolbar.items?.filter { $0.title == "1" }
        eyeglassArray?.first?.enabled = false
    }
    
    
    func mustache(){
        print(#function)
        let mustacheSticker = stickerImageView(image: UIImage(named: "mustache3"))
        mustacheSticker.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(mustacheSticker)
        stickersArray.append(mustacheSticker)
        toolbar.items![2].enabled = false
        
        let eyeglassArray = toolbar.items?.filter { $0.title == "2" }
        eyeglassArray?.first?.enabled = false

        
    }
    
    func hat(){
        print(#function)
        let hatSticker = stickerImageView(image: UIImage(named: "hat1"))
        hatSticker.frame.origin = CGPoint(x: 50, y: 50)
        //array.append(nameofarray)
        self.view.addSubview(hatSticker)
        stickersArray.append(hatSticker)
        toolbar.items![4].enabled = false
        
        let eyeglassArray = toolbar.items?.filter { $0.title == "3" }
        eyeglassArray?.first?.enabled = false

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














