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
