//
//  ProfileCoordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/07/21.
//

import UIKit

class ProfileCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let usrData = CrudUserDefaults().getUserCredentials()
        let nickname = usrData.first ?? String.empty
        let username = usrData.last ?? String.empty
        
        let profileScreen = ProfileViewController(dataUser: UserData(nick: nickname, user: username))
        profileScreen.onLogoff = {
            CrudUserDefaults().delete()
            KeychainService.deleteCredentials()
            let startScreen = StartCoordinator(navigationController: self.navigationController)
            startScreen.start()
        }
        self.navigationController.pushViewController(profileScreen, animated: true)
    }
}
