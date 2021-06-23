//
//  StringAlertConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 22/06/21.
//

import Foundation

enum AlertTitle: CustomStringConvertible {
    case DearUser
    case Warning
    
    var description: String {
        switch self {
        case .DearUser:
            return "Caro usuário"
        case .Warning:
            return "Atenção!"
        }
    }
}

enum AlertMessage: CustomStringConvertible {
    case MailError
    case NoNickname
    case NoPasswd
    
    var description: String {
        switch self {
        case .MailError:
            return "Digite um e-mail válido."
        case .NoNickname:
            return "Digite um nome ou apelido."
        case .NoPasswd:
            return "Digite uma senha."
        }
    }
}

enum AlertButton: String {
    case OK = "Ok"
    case CANCEL = "Cancelar"
}
