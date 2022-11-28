//
//  UsersWorker.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import Foundation


class UsersWorker {
    
    //MARK:- Properties
    
    
    //MARK:- Methods
    
    func getData(completionHandler: @escaping ((Result<[Users],Error>)-> Void)) {
        print("Get data from API -User Worker")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            do {
                let decodedData = try JSONDecoder().decode([Users].self, from: data)
                completionHandler(.success(decodedData))
            }catch{
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
}
