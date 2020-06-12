//
//  UserViewModel.swift
//  Mvvm_Alamofire_JsonDecoder
//
//  Created by swapnil jadhav on 12/06/20.
//  Copyright © 2020 t. All rights reserved.
//

import Foundation
import Alamofire
class UserViewModel
{
    weak var viewController : ViewController?
    
    var arrUsers = [UserModel]()
    
    let url = "https://jsonplaceholder.typicode.com/todos"
    
    func getAllUserAf()
    {
        
        AF.request("https://jsonplaceholder.typicode.com/todos").response {response in
            
            if let data = response.data
            {
                
                do
                {
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    
                    
                    self.arrUsers.append(contentsOf: userResponse)
                    
                    DispatchQueue.main.async {
                        self.viewController?.tblView.reloadData()
                    }
                    
                }
                catch
                {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getAllUserData()
    {
        
        
        
        URLSession.shared.dataTask(with: URL(string: url)!) {[weak self] (data, response, error) in
            
            
            if error == nil
            {
                if let data = data
                {
                    do
                    {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        
                        
                        self?.arrUsers.append(contentsOf: userResponse)
                        
                        DispatchQueue.main.async {
                            self?.viewController?.tblView.reloadData()
                        }
                        
                        
                    }
                    catch let errors
                    {
                        print(errors.localizedDescription)
                    }
                }
                
            }
            else
            {
                guard let error = error?.localizedDescription else {return}
                
                print(error)
            }
            
        }.resume()
    }
}
