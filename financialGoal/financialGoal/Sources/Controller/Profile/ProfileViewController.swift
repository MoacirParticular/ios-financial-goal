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
    let dataUser = UserData(nick: "Sabino Sampaio", user: "sabino@hotmail.com")
    
    override func loadView() {
        self.view = profileView
        self.profileView.createView(dataUser)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenButton()
        
    }
    
    private func listenButton() {
        profileView.onLogoff = {
            self.onLogoff?()
        }
    }
}
