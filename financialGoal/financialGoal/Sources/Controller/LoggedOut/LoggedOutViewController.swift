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
    
    func callAutoLogin(){
        var user = String.empty
        var pass = String.empty
        var containCredential:Bool = false
        
        if let userKey = UserDefaults.standard.value(forKey: StringConstants.userKey) as? String{
            user = userKey
            if let passKey = UserDefaults.standard.value(forKey: StringConstants.passKey) as? String{
                pass = passKey
                containCredential = true
            }
        }
        if containCredential{
            self.showActivity()
            requestLogin().login(user, pass) { (result) in
                switch(result) {
                case .success(let returnData):
                    guard let nickNameLogado = returnData.user?.nickname else {return}
                    if returnData.res == true {
                        SignInData.nickname = nickNameLogado
                        self.onLoginButton?(.AutoLogin)
                    }
                case .failure( _):
                    self.showDefaultAlert(.Warning, AlertMessage.NoConnection)
                }
            }
        }
    }
}

//MARK: Liga o scrollView com o page controll
extension LoggedOutViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loggedOutView.pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
