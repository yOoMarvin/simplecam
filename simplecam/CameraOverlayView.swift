//
//  CameraOverlayView.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 09.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class CameraOverlayView: UIView {
    
    var delegate: CamerOverlayViewDelegate?
    
    @IBAction func takePicture(_ sender: Any) {
        if let delegate = delegate {
            delegate.takePicture()
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        if let delegate = delegate {
            delegate.cancel()
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
