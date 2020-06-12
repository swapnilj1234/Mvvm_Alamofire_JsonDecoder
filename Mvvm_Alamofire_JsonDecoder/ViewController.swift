//
//  ViewController.swift
//  Mvvm_Alamofire_JsonDecoder
//
//  Created by swapnil jadhav on 12/06/20.
//  Copyright © 2020 t. All rights reserved.
//


//SWIFT PACKAGE MANAGER

//1.goto file add package manager -> add url of git -> select type e.g-> version ,branch etc
//2. import alamofire
//3.AF.request("https://jsonplaceholder.typicode.com/todos").response {response in}



import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
    var viewModelUser = UserViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.viewController = self
        //viewModelUser.getAllUserData()
        
        viewModelUser.getAllUserAf()
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "usercell")
    }


    
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModelUser.arrUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
  let cell = tblView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as? UserCell
  
        
        cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
         
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

