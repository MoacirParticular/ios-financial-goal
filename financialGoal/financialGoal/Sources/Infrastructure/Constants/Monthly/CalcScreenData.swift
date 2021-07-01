//
//  CalcScreenData.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

class CalcScreenData {
    let screen: TypeScreenCalc
    let firstLabel: String
    let secondLabel: String
    let thirdLabel: String
    let fourthLabel: String
    let fifthLabel: String
    let buttonTitle: String
    
    init(_ screen: TypeScreenCalc, _ lb1: String, _ lb2: String, _ lb3: String, _ lb4: String,
         _ lb5: String, _ button: String) {
        self.screen = screen
        self.firstLabel = lb1
        self.secondLabel = lb2
        self.thirdLabel = lb3
        self.fourthLabel = lb4
        self.fifthLabel = lb5
        self.buttonTitle = button
    }
}
