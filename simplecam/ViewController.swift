//
//  ViewController.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 08.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func newImageTapped(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Please choose",
                                      message: "Choose your source",
                                      preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            sheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
                (action: UIAlertAction) in
                
                // TODO: pickerview
            }))

        }
        
        sheet.addAction(UIAlertAction(title: "Library", style: .default, handler: {
            (action: UIAlertAction) in
            
            // TODO: pickerview
        }))
        
        present(sheet, animated: true, completion: nil)
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

