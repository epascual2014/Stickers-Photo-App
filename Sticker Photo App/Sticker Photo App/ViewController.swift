//
//  ViewController.swift
//  Sticker Photo App
//
//  Created by Edrick Pascual on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum stickerName: String {
        case eyeglasses = "1"
        case mustache = "2"
        case hat = "3"
        
    }
    
    @IBAction func getImageTapped(sender: AnyObject) {
        
    }
    
    //MARK: Toolbar Buttons
    
    @IBAction func stickerTapped(sender: UIBarButtonItem) {

        switch sender.title {
        case stickerName.eyeglasses.rawValue?:
            eyeglasses()
        case stickerName.mustache.rawValue?:
            mustache()
        case stickerName.hat.rawValue?:
            hat()
        default
            break
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

