//
//  MotherCalcs.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 30/06/21.
//

import UIKit

class MotherCalcs: UIViewController, ViewCalcProtocol {
    var viewCalc: ApplicationCalcView = ApplicationCalcView(frame: .zero)
    let scrollView: UIScrollView = UIScrollView(frame: .zero)

    func setUp(dataScreen: CalcScreenData) {
        self.setupView(infoScreen: dataScreen, viewBase: scrollView)
        self.view = scrollView
        self.view.backgroundColor = .backgroundCustomGoal
    }
    
    func setDelegates() {
        viewCalc.tfFirst.delegate = self
        viewCalc.tfSecond.delegate = self
        viewCalc.tfThird.delegate = self
        viewCalc.tfFourth.delegate = self
    }
    
    func listennerKeyBoardCalcs() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        let contentInsets = UIEdgeInsets(top: KeyboardListenner.zeroCG, left: KeyboardListenner.zeroCG, bottom: keyboardSize.height , right: KeyboardListenner.zeroCG)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: KeyboardListenner.zeroCG, left: KeyboardListenner.zeroCG, bottom: KeyboardListenner.zeroCG, right: KeyboardListenner.zeroCG)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

extension MotherCalcs: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var responseBolean = true
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        responseBolean = string.rangeOfCharacter(from: invalidCharacters) == nil
        if responseBolean {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= ValueCalcsConstants.limitCharacters
        }
        return responseBolean
    }
}
