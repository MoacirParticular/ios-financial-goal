//
//  SignInPasswdViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

class SignInPasswdViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInPasswdView(frame: FrameConstants.frameZero)
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
//    result.get().message
    private func getButtonAction() {
        overrideView.buttonAction = {
            self.buttonAction?()
            self.requestApi()
        }
    }
    
    private func requestApi() {
        Request().signIn("teste", "teste", "teste") { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                print(messsage)
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Caro usuário", message: messsage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
