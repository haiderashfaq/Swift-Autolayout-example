//
//  AppConstants.swift
//  Swift autolayout example
//
//  Created by Haider Ashfaq on 21/07/2018.
//  Copyright © 2018 Haider Ashfaq. All rights reserved.
//

import Foundation
import UIKit


struct K {
    struct UI {
        struct WIDTH {
            static let TEXTFIELD_BORDER:CGFloat = 1.0
            static let BUTTON_BORDER:CGFloat = 1.0
            static let SCREEN:CGFloat = UIScreen.main.bounds.size.width
        }
        
        struct HEIGHT {
            static let TEXTFIELD:CGFloat = 36.0
            static let BUTTON:CGFloat = 50.0
        }
        
        struct SIZE {
            
        }
        
        struct CORNER_RADIUS {
            static let TEXTFIELD:CGFloat = 5.0
            static let BUTTON:CGFloat = 5.0
        }
        
        struct INSET {
            static let SIDE_BORDER:CGFloat = 20.0
            static let LARGE_SIDE_BORDER:CGFloat = SIDE_BORDER * 2.0
            static let SMALL_SIDE_BORDER:CGFloat = SIDE_BORDER * 0.5
            static let EXTRASMALL_SIDE_BORDER:CGFloat = SIDE_BORDER * 0.25
        }
        
        struct ALPHA {
            static let MENU_ITEM:CGFloat = 0.8
        }
    }
}
