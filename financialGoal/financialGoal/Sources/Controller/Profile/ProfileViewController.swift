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
    let dataUser: UserData
    
    
    init(dataUser: UserData) {
        self.dataUser = dataUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
