//
//  requestForgotPassword.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 21/06/21.
//

import UIKit

class RequestForgotPassword {
    
}


func openRequest() {
    // Preparando dados para requisição
    let url =  URL(string: "https://zdktzx1nbi.execute-api.sa-east-1.amazonaws.com/dev/recovery-password/")!
    var request = URLRequest(url: url)
    request.allHTTPHeaderFields = [
        "x-api-key": "3AIT9CyxID2ZZduEToo532TeaQay2qKa8oSRwotL"
    ]

    
    let body = [
        "username": "leojportes@gmail.com"
    ]

    let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
    request.httpMethod = "POST"
    request.httpBody = bodyData

    // Efetuando requisição
    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in

        if let error = error {
            print("-- Deu ruim ", error)
        } else if let data = data {
            do {
                let dataResponse = try JSONDecoder().decode(ReturnDecode.self, from: data)
                print(dataResponse)
                
            } catch {
                print("-- Falha na decodificação")
            }
            print("-- Segue os dados" , data)
        } else {
            print("Não sei o que houve")
        }
    }
    task.resume()
}
