//
//  LoggedOutViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 15/06/21.
//

import UIKit

class LoggedOutViewController: UIViewController {
    var onLoginButton: ((_ setLogin: LoginType ) -> Void)?
    
    private let loggedOutView = LoggedOutView(frame: FrameConstants.frameZero)
    
    override func viewDidLoad() {
        setupView()
        setActions()
        callAutoLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupView(){
        super.viewDidLoad()
        loggedOutView.scrollView.delegate = self
    }
    
    override func loadView() {
        self.view = loggedOutView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loggedOutView.setFramePageScroll()
    }
    
    //MARK: Actions Buttons
    private func setActions() {
        loggedOutView.onLoginButton = { setLogin in
            self.onLoginButton?(setLogin)
        }
    }
    
    func callAutoLogin() {
        let data = KeychainService.loadCredentials()
        if KeychainService.verifyIfExists() {
            guard let username = data.first else { return }
            guard let password = data.last else { return }
            
            self.showActivity()
            let login = LoginViewModel()
            login.login(username, password, self) { (returnApi) in
                if returnApi {
                    self.onLoginButton?(.AutoLogin)
                }
            }
        }
    }
}

//MARK: Liga o scrollView com o page controll
extension LoggedOutViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loggedOutView.pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
