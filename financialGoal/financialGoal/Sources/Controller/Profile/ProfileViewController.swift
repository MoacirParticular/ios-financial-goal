//
//  ProfileViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    lazy var profileView = ProfileView(frame: .zero)
    var onLogoff: (() -> Void)?
    let dataUser = UserData(nick: SignInData.nickname, user: SignInData.username)
    
    override func loadView() {
        self.view = profileView
        self.profileView.createView(dataUser)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationTitleConfig(title: "Perfil")
        listenButton()
    }
    
    private func listenButton() {
        profileView.onLogoff = {
            self.onLogoff?()
        }
    }
}
