//
//  accessibilityLocalizebleStrings.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import Foundation

enum accessibilityLocalizebleStrings: String {
    func localize() -> String {
        rawValue.localize(true)
    }
    
    case titleViewPig
}
