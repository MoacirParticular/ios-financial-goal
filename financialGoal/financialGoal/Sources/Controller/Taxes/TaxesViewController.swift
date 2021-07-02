//
//  TaxesViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//

import UIKit

class TaxesViewController: UIViewController {
    
    //MARK: Proprieties:
    var taxesView = TaxesView(frame: FrameConstants.frameZero)
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        calcTaxes()
        self.view.backgroundColor = .backgroundCustomGoal
        navigationTitleConfig(title: StringConstantsTaxes.titleTaxes)
    }
    
    override func loadView() {
        self.view = taxesView
    }
    
    //MARK: Função para acionar o cálculo no click do textField
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        calcTaxes()
    }
    
    //MARK: Inserindo resultado do cálculo e transformando em Duble
    func calcTaxes(){
        guard let tfYearly = self.taxesView.textFieldYearly.text else {return}
        let valueString = NSString(string: tfYearly)
        let valueConvertedDouble = valueString.doubleValue
        self.taxesView.textFieldMonthly.text = calc2(valueConvertedDouble)+ValueCalcTaxes.formatPorcent
    }
    
    //MARK: Cálculo para conversão de taxa anual para mensal.
    func calc2(_ num: Double) -> String {
        var resultado = (num / ValueCalcTaxes.divHundred) + ValueCalcTaxes.opOne
        resultado = pow(resultado, ValueCalcTaxes.opPow)
        resultado = (resultado - ValueCalcTaxes.opOne) * ValueCalcTaxes.divHundred
        let final = String(format: ValueCalcTaxes.formatDec, resultado)
        return final
    }

}
