//
//  MonthlyViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

class MonthlyViewController: MotherCalcs {
    
    override func loadView() {
        self.setUp(dataScreen: InfoCalcScreen.monthly)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: TitleCalcScreen.monthlyTitle)
        listennerKeyBoardCalcs()
        listemButton()
    }
    
    private func listemButton() {
        self.viewCalc.buttonAction = {
            self.getDataInputs()
        }
    }
    
    private func getDataInputs() {
        guard let numberOfMonthly = self.viewCalc.tfFirst.text else { return }
        guard let monthlyRate = self.viewCalc.tfSecond.text else { return }
        guard let initialApplication = self.viewCalc.tfThird.text else { return }
        guard let monthlyValue = self.viewCalc.tfFourth.text else { return }
        self.viewCalc.tfFifth.text = numberOfMonthly + monthlyRate + initialApplication + monthlyValue
        print(numberOfMonthly, monthlyRate, initialApplication, monthlyValue)
    }
}
