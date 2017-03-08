//
//  ViewController.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 08.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    
    @IBAction func newImageTapped(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Please choose",
                                      message: "Choose your source",
                                      preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            sheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
                (action: UIAlertAction) in
                
                // create picker
                let picker = self.preparePicker(srcType: .camera)
                self.present(picker, animated: true, completion: nil)
            }))

        }
        
        sheet.addAction(UIAlertAction(title: "Library", style: .default, handler: {
            (action: UIAlertAction) in
            
            // create picker
            let picker = self.preparePicker(srcType: .photoLibrary)
            self.present(picker, animated: true, completion: nil)
        }))
        
        present(sheet, animated: true, completion: nil)
    }
    
    
    
    
    private func preparePicker(srcType: UIImagePickerControllerSourceType) -> UIImagePickerController {
    
        let tmpPicker = UIImagePickerController()
        tmpPicker.sourceType = srcType //comes from parameters
        tmpPicker.mediaTypes = [kUTTypeImage as String]
        tmpPicker.allowsEditing = true
        tmpPicker.delegate = self
        
        return tmpPicker
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

// MARK: Extensions

extension ViewController:UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // TODO: use picture, for example in storyboard
        
        dismiss(animated: true, completion: nil)
    }
}


extension ViewController: UINavigationControllerDelegate {
    
}
