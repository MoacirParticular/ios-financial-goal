//
//  CrudUserDefaults.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 04/07/21.
//

import Foundation

class CrudUserDefaults {
    
    func save(_ user: String, _ pass: String) {
        UserDefaults.standard.set(user, forKey: StringConstants.userKey)
        UserDefaults.standard.set(pass, forKey: StringConstants.passKey)
    }
    
    public func delete() {
        if let project = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: project)
            UserDefaults.standard.synchronize()
        }
    }
    
    func verifyHaveData() -> Bool {
        return UserDefaults.standard.object(forKey: StringConstants.userKey) != nil
    }
    
    func getUserCredentials() -> [String] {
        let username = UserDefaults.standard.value(forKey: StringConstants.userKey) as? String ?? String.empty
        let password = UserDefaults.standard.value(forKey: StringConstants.passKey) as? String ?? String.empty
        return[username,password]
    }
}
