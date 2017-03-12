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
    
    var picker = UIImagePickerController()
    lazy var imageResource = ImageResource()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func newImageTapped(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Please choose",
                                      message: "Choose your source",
                                      preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            sheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
                (action: UIAlertAction) in
                
                // create picker
                 self.picker = self.preparePicker(srcType: .camera)
                self.present(self.picker, animated: true, completion: nil)
            }))

        }
        
        sheet.addAction(UIAlertAction(title: "Library", style: .default, handler: {
            (action: UIAlertAction) in
            
            // create picker
            self.picker = self.preparePicker(srcType: .photoLibrary)
            self.present(self.picker, animated: true, completion: nil)
        }))
        
        present(sheet, animated: true, completion: nil)
    }
    
    
    
    
    private func preparePicker(srcType: UIImagePickerControllerSourceType) -> UIImagePickerController {
    
        let tmpPicker = UIImagePickerController()
        tmpPicker.sourceType = srcType //comes from parameters
        tmpPicker.mediaTypes = [kUTTypeImage as String]
        tmpPicker.allowsEditing = true
        tmpPicker.delegate = self
        
        //display custom cam overlay only for the camera action
        if srcType == .photoLibrary {
            return tmpPicker
        }
        
        //camera overlay
        tmpPicker.showsCameraControls = false
        let controller = CameraOverlayViewController(nibName: "CameraOverlayViewController", bundle: nil)
        let overlayView = controller.view as! CameraOverlayView
        overlayView.delegate = self
        overlayView.frame = tmpPicker.view.frame
        tmpPicker.cameraOverlayView = overlayView
        
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


// MARK: Protocol

protocol CamerOverlayViewDelegate {
    func cancel()
    func takePicture()
}

// MARK: Extensions

extension ViewController: CamerOverlayViewDelegate {
    
    
    func cancel() {
        picker.dismiss(animated: true, completion: nil)
        picker = UIImagePickerController()
    }
    
    func takePicture() {
        picker.takePicture()
        picker = UIImagePickerController()
    }
}





extension ViewController:UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        //do something with image
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}


extension ViewController: UINavigationControllerDelegate {
    
}
