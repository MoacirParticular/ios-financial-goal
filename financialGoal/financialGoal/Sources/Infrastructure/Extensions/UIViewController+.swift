//
//  UIViewController+.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 18/06/21.
//

import UIKit

extension UIViewController {
    
    public func listennerKeyBoard() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(ViewController.keyboardShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(ViewController.keyboardHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(sender: Notification) {
        let heightOriginalScreen: CGFloat = UIScreen.main.bounds.height
        guard let kboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = kboardFrame.cgRectValue.height
        let heightScreen =  heightOriginalScreen - keyboardHeight
        self.view.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        self.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.view.heightAnchor.constraint(equalToConstant: heightScreen).isActive = true
    }
    
    @objc func keyboardHide(sender: Notification) {
        self.view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func navigationTitleConfig(title: String){
        self.navigationController?.navigationBar.topItem?.backButtonTitle = title
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .black
    }
}
