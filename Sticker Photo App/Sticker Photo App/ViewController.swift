//
//  ViewController.swift
//  Sticker Photo App
//
//  Created by Edrick Pascual on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum StickerName: String {
        case Eyeglasses = "1"
        case Mustache = "2"
        case Hat = "3"
        case Done = "DONE"
        
    }
    
    var imagePickerController: UIImagePickerController!
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var imageCaptureButton: UIButton!
	@IBOutlet weak var toobar: UIToolbar!
    
    @IBAction func getImageTapped(sender: AnyObject) {
        
        _ = PhotoTakingHelper(viewController: self) { (image: UIImage?) in
            if let image = image {
                self.imageView.image = image
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
        // TODO: fix image position
        //let eyeGlassImageSize = imageView.image?.size
        
        eyeglassSticker.frame.origin = CGPoint(x: 50, y: 200)
        
        self.view.addSubview(eyeglassSticker)
            
    }
    
    
    func mustache(){
        print(#function)
        let mustacheSticker = stickerImageView(image: UIImage(named: "mustache3"))
        mustacheSticker.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(mustacheSticker)
        
    }
    
    func hat(){
        print(#function)
        let hatSticker = stickerImageView(image: UIImage(named: "hat1"))
        hatSticker.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(hatSticker)
        
    }
    
    func done(){
        print(#function)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
		dismissViewControllerAnimated(true, completion: nil)
		imageView.image = image
		toobar.hidden = false
		imageCaptureButton.hidden = true

	}
	
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}














