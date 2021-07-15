//
//  ViewComponent.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 15/07/21.
//

import UIKit

class ViewComponent: UIView {
    
    init(background: UIColor = .clear, radius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) {
        super.init(frame: FrameConstants.frameZero)
        self.frame = FrameConstants.frameZero
        self.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        self.backgroundColor = background
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
   
    
}
