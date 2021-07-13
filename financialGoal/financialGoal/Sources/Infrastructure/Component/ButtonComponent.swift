//
//  ButtonComponent.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 08/07/21.
//

import UIKit

class ButtonComponent: UIButton {
    
    init(title: String, background: UIColor = .clear, colorTitle: UIColor, font: UIFont, radius: CGFloat = 0) {
        super.init(frame: FrameConstants.frameZero)
        self.frame = FrameConstants.frameZero
        self.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        self.backgroundColor = background
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(colorTitle, for: .normal)
        self.layer.cornerRadius = radius
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
   
    
}



