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
        self.view.backgroundColor = .backgroundCustomGoal
        navigationTitleConfig(title: StringConstantsTaxes.titleTaxes)
        self.taxesView.textFieldYearly.delegate = self
    }
    
    override func loadView() {
        self.view = taxesView
    }
    
    //MARK: Inserindo resultado do cálculo e transformando em Duble
    func calcTaxes(tax: String){
        guard let valueConvertedDouble = Double(tax) else {return}
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

//MARK: Extension
extension TaxesViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = self.taxesView.textFieldYearly.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        calcTaxes(tax: newString)
        return true
    }
}
