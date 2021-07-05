//
//  StringAlertConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 22/06/21.
//

import Foundation

enum AlertTitle: CustomStringConvertible {
    case Warning
    case InvalidMail
    case InvalidPassword
    case InvalidNickname
    case DearUser
    case CountSuccess

    
    var description: String {
        switch self {
        case .Warning:
            return "Atenção"
        case .InvalidMail:
            return "E-mail inválido"
        case .InvalidNickname:
            return "Nome ou apelido inválido"
        case .InvalidPassword:
            return "Senha inválida"
        case .DearUser:
            return "Caro usuário"
        case .CountSuccess:
            return "Parabéns"

        }
    }
}

enum AlertMessage: CustomStringConvertible {
    case MailError
    case NoNickname
    case NoPasswd
    case NoConnection
    case SimulatorUnavailable
    case TryAgainLatter
    case InputError
    case Unavailable
    
    var description: String {
        switch self {
        case .MailError:
            return "Digite um e-mail válido."
        case .NoNickname:
            return "Digite um nome ou apelido."
        case .NoPasswd:
            return "Digite uma senha com 8 ou mais caractéres."
        case .NoConnection:
            return "Erro de conexão."
        case .SimulatorUnavailable:
            return "Simulador não disponível."
        case .TryAgainLatter:
            return "Erro, tente novamente mais tarde."
        case .InputError:
            return "Todos os valores devem ser maior que zero."
        case .Unavailable:
            return "Funcionalidade indisponível."
        }
    }
}

enum AlertButton: String {
    case OK = "Ok"
    case CANCEL = "Cancelar"
}
