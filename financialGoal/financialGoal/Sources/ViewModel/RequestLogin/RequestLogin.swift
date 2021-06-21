//
//  requestLogin.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 21/06/21.
//

import UIKit

class RequestLogin {
    func openRequest() {
        // Preparando dados para requisição
        let url =  URL(string: "https://zdktzx1nbi.execute-api.sa-east-1.amazonaws.com/dev/login/")!
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = [
            "x-api-key": ApiKey.value
        ]
        
        let body = [
            "username": "teste@ios.com",
            "password": "12345678"
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
                    guard let result = dataResponse.message else {return}
                    print(result)
                    
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
}
