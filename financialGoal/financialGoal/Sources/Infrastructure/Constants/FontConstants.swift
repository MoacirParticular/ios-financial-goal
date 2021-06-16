//
//  FontConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 15/06/21.
//

import UIKit

public extension UIFont {
    
    static let fontDefaultGeorgia = UIFont(name: "Georgia", size: 16) ?? UIFont()
    
    static var fontButtonsBlack: UIFont {
        return UIFont(name: "Roboto-Black", size: 16) ?? fontDefaultGeorgia
    }
    static var fontLabelTitleRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 24) ?? fontDefaultGeorgia
    }
    static var fontLabelSubTitleRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 15) ?? fontDefaultGeorgia
    }
}

