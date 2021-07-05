//
//  ValueCalcs.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//

import UIKit

struct ValueCalcsConstants {
    static let valueXFrameSeparator:CGFloat = 0
    static let separatorHeight: CGFloat = 2
    static let valueHeightForRowAt:CGFloat = 72
    static let limitCharacters: Int = 5
    static let minimumValue: Double = 0.0001
    static let charactersAccepted: String = "0123456789."
    
    //backview
    static let valueFrameBackView = CGRect(x: 0, y: 0, width: 0, height: 72)
    static let valueFrameIconImage = CGRect(x: 10, y: 13, width: 48, height: 48)
    static let valueFrameLabel = CGRect(x: 70, y: 15, width: 260, height: 45)
}
