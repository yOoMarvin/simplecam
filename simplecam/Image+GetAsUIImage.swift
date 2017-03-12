//
//  Image+GetAsUIImage.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 12.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation
import UIKit

extension Image {
    
    var image: UIImage? {
        guard let imageData = self.imageData as? Data else {
            return nil
        }
        
        return UIImage(data: imageData)
    }
}
