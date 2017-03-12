//
//  CameraOverlayViewController.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 09.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class CameraOverlayViewController: UIViewController {
    
    @IBOutlet weak var snapButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //buttons rounded
        snapButton.layer.cornerRadius = 0.5 * snapButton.bounds.size.width
        cancelButton.layer.cornerRadius = 0.5 * cancelButton.bounds.size.width


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
