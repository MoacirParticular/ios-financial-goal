//
//  SignInMailViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/06/21.
//

import UIKit

class SignInMailViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInMailView(frame: FrameConstants.frameZero)
    var buttonAction: (() -> Void)?
    
    // MARK: - Methods/ Functions
    override func loadView() {
        self.view = self.overrideView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: ScreenAttributes.screenTitle )
        getButtonAction()
        listennerKeyBoard()
    }
    
    private func getButtonAction() {
        overrideView.buttonAction = {
            self.buttonAction?()
        }
    }
}
