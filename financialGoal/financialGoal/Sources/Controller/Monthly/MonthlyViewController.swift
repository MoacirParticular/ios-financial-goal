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
        let collectionData = [numberOfMonthly, monthlyRate, initialApplication, monthlyValue]
        self.requestToApi(collectionData)
    }
    
    private func requestToApi(_ collectionValues: [String]) {
        let request = MonthlyViewModel()
        if !dataValidation(collectionValues){
            showDefaultAlert(.Warning, .InputError)
            return
        }
        let dataToSubmit = collectionToStruct(collectionValues)
        self.showActivity()
        request.request(dataToSubmit) { (dataReturned, errorReturned) in
            if let data = dataReturned?.accruedEarnings {
                DispatchQueue.main.async {
                    self.removeActivity()
                    let valueString = NSString(string: data)
                    let valueConvertedDouble = valueString.doubleValue
                    self.viewCalc.tfFifth.text =  YearlyConstants.realValue + self.formatNumberToDecimal(value: valueConvertedDouble)
                }
            }
        }
    }
    
    private func dataValidation(_ collectionValues: [String]) -> Bool {
        for i in collectionValues {
            let valueString = NSString(string: i)
            let valueConvertedDouble = valueString.doubleValue
            
            if valueConvertedDouble < 1 {
                return false
            }
        }
        return true
    }
    
    private func collectionToStruct(_ collectionValues: [String]) -> StructApplicationCalc {
        return StructApplicationCalc(initial: collectionValues[2], monthly: collectionValues[3],
                                     profitability: collectionValues[1], period: collectionValues[0])
    }
}
