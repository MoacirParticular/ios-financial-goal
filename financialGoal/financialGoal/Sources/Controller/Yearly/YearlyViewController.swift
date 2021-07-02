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
        setDelegates()
    }
    
    private func listemButton() {
        self.viewCalc.buttonAction = {
            self.getDataInputs()
        }
    }
    
    private func getDataInputs() {
        guard let periodInMonths = self.viewCalc.tfFirst.text else { return }
        guard let monthlyRate = self.viewCalc.tfSecond.text else { return }
        guard let singleApplicationToday = self.viewCalc.tfThird.text else { return }
        let collectionData = [periodInMonths, monthlyRate, singleApplicationToday]
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
        return StructApplicationCalc(initial: collectionValues[2], monthly: String.empty,
                                     profitability: collectionValues[1], period: collectionValues[0])
    }

    
}
