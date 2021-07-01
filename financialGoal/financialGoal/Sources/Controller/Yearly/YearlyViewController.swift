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
        guard let periodInMonths = self.viewCalc.tfFirst.text else { return }
        guard let monthlyRate = self.viewCalc.tfSecond.text else { return }
        guard let singleApplicationToday = self.viewCalc.tfThird.text else { return }
        requestApi(periodInMonths, monthlyRate, singleApplicationToday )
    }
    
    //MARK: Resposta da API com alert ou direcionando para home
    private func requestApi(_ periodInMonths: String, _ monthlyRate: String, _ singleApplicationToday: String) {
        self.showActivity()
        RequestYearly().yearly(periodInMonths, monthlyRate, singleApplicationToday) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.accruedEarnings else { return }
                DispatchQueue.main.async {
                    self.removeActivity()
                    //Converte o retorno da api para Double
                    let valueString = NSString(string: messsage)
                    let valueConvertedDouble = valueString.doubleValue
                   
                    self.viewCalc.tfFifth.text = ( YearlyConstants.realValue + self.formatNumberToDecimal(value: valueConvertedDouble ))
                }
            case .failure( _):
                self.showDefaultAlert(.Warning, AlertMessage.NoConnection)
            }
        }
    }
    
}
