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
        
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
		imagePickerController.sourceType = .PhotoLibrary
		imagePickerController.allowsEditing = false
		self.presentViewController(imagePickerController, animated: true, completion: nil)
        
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

    func eyeglasses(){
        print(#function)
        
    }
    
    func mustache(){
        print(#function)
        
    }
    
    func hat(){
        print(#function)
        
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














