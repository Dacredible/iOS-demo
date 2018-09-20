//
//  ViewController.swift
//  insta
//
//  Created by David Li on 9/4/18.
//  Copyright © 2018 David Li. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageVIew: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageVIew.image = image
        } else {
            print("erro when getting image")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        
        self.present(imagePickerController, animated: true) {
            print("pick done")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let comment = PFObject(className: "Comment")
//
//        comment["text"] = "Nice shot!"
//
//        comment.saveInBackground { (success, error) in
//            if (success) {
//                print("successful")
//            } else {
//                print("failed")
//            }
//        }

        let query = PFQuery(className: "Comment")
        
        query.getObjectInBackground(withId: "169MWECTFX") { (object, error) in
            if let comment = object {
                print(comment)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

