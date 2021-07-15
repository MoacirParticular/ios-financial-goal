//
//  CrudUserDefaults.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 04/07/21.
//

import Foundation

class CrudUserDefaults {
    
    
    // MARK: - User identify
    func verifyHaveData() -> Bool {
        return UserDefaults.standard.object(forKey: StringConstants.username) != nil
    }
    
    func save(_ user: String, _ nick: String) {
        if user != String.empty {
            UserDefaults.standard.set(user, forKey: StringConstants.username)
        }
        if nick != String.empty {
            UserDefaults.standard.set(nick, forKey: StringConstants.nickname)
        }
    }
    
    func getUserCredentials() -> [String] {
        let nickname = UserDefaults.standard.value(forKey: StringConstants.nickname) as? String ?? String.empty
        let username = UserDefaults.standard.value(forKey: StringConstants.username) as? String ?? String.empty
        return[nickname, username]
    }
    
    public func delete() {
        if let project = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: project)
            UserDefaults.standard.synchronize()
        }
    }
    
    // MARK: - Screen calc
    func saveScreen(_ screen: String) {
        UserDefaults.standard.set(screen, forKey: StringConstantsCalcs.forKeyCals)
    }
    
    func verifyHaveScreenData() -> Bool {
        if let _ = UserDefaults.standard.value(forKey: StringConstantsCalcs.forKeyCals) as? String {
            return true
        }
        return false
    }
    
    func getLastScreenCalc() -> String {
        return UserDefaults.standard.value(forKey: StringConstantsCalcs.forKeyCals) as? String ?? String.empty
    }
}
