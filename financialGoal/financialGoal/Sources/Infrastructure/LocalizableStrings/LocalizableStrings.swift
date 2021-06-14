//
//  LocalizableStrings.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import Foundation

enum LocalizableStrings: String {
    func localize() -> String {
        rawValue.localize(false)
    }
    
    case titleViewPig
    
    
}

extension String {
    func localize(_ accessibility: Bool = false) -> String {
        let pathBundle: Bundle = .current
        
        return NSLocalizedString(self, tableName: accessibility ? "accessibilityFinancialGoalLocalizeble" : "financialGoalLocalizeble" , bundle: pathBundle, value: String(), comment: String())
    }
}


