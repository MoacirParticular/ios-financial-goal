//
//  LoggedOutViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 15/06/21.
//

import UIKit

class LoggedOutViewController: UIViewController {
    
    var onLoginButton: ((_ setLogin: LoginType ) -> Void)?
    
    let loggedOutView = LoggedOutView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loggedOutView.scrollView.delegate = self
        loggedOutView.addToViewControllerPageControl(view: view)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setActions()
    }
    
    override func loadView() {
        self.view = loggedOutView
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loggedOutView.setFramePageScroll(view: view)
    }
    //MARK: Actions Buttons
    private func setActions() {
        loggedOutView.onLoginButton = { setLogin in
            self.onLoginButton?(setLogin)
        }
    }

}
// Liga o scrollView com o page controll
extension LoggedOutViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loggedOutView.pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
