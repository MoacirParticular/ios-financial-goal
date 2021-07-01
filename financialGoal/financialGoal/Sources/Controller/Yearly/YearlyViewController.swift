//
//  YearlyViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 01/07/21.
//

import UIKit

class YearlyViewController: MotherCalcs {
    
    override func loadView() {
        self.setUp(dataScreen: InfoCalcScreen.yearly)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: TitleCalcScreen.yearlyTitle)
        listennerKeyBoardCalcs()
        listemButton()
    }
    
    private func listemButton() {
        self.viewCalc.buttonAction = {
            self.getDataInputs()
        }
    }
    
    private func getDataInputs() {
        guard let numberOfYearly = self.viewCalc.tfFirst.text else { return }
        guard let yearlyRate = self.viewCalc.tfSecond.text else { return }
        guard let initialApplication = self.viewCalc.tfThird.text else { return }
        guard let yearlyValue = self.viewCalc.tfFourth.text else { return }
        self.viewCalc.tfFifth.text = numberOfYearly + yearlyRate + initialApplication + yearlyValue
        print(numberOfYearly, yearlyRate, initialApplication, yearlyValue)
    }
}
