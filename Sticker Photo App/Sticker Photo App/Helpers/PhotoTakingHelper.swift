//
//  PhotoTakingHelper.swift
//  Sticker Photo App
//
//  Created by Jorge Bastos on 6/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

typealias PhotoTakingCallback = UIImage? -> Void

class PhotoTakingHelper: NSObject {
    
    weak var viewController: UIViewController!
	var photoTakingCallback: PhotoTakingCallback
    var imagePickerController: UIImagePickerController?
	
	
    init(viewController: UIViewController, callback: PhotoTakingCallback) {
		self.viewController = viewController
        self.photoTakingCallback = callback
        
        super.init()
        
        showPhotoSourceSelection()
        
	}
    
    func showImagePicker(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController?.delegate = self
        
        self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
        
    }
    
    // ALERT
    func showPhotoSourceSelection(){
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
        alertController.addAction(cancelAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo from Library", style: .Default) {
            (action) in self.showImagePicker(.PhotoLibrary)
        }
        
        alertController.addAction(photoLibraryAction)
        
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear)) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default) {
                (action) in self.showImagePicker(.Camera)
            }
            alertController.addAction(cameraAction)
        }
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }

	func takeScreeShot(screen: UIView) -> UIImage {
		UIGraphicsBeginImageContext(screen.bounds.size)
		screen.layer.renderInContext(UIGraphicsGetCurrentContext()!)
		let screenShot = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return screenShot
	}
}

extension PhotoTakingHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        viewController.dismissViewControllerAnimated(false, completion: nil)
        photoTakingCallback(image)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}