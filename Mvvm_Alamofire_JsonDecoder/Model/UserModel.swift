//
//  UserModel.swift
//  Mvvm_Alamofire_JsonDecoder
//
//  Created by swapnil jadhav on 12/06/20.
//  Copyright © 2020 t. All rights reserved.
//

import Foundation
import UIKit

struct UserModel : Codable
{
    let userId : Int?
    let id : Int?
    let title : String?
    let completed : Bool?
    
    
    init(userid:Int,id:Int,title:String,completed:Bool) {
        
        self.userId = userid
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func getStatusColor() -> (String,UIColor)
    {
        if completed ?? true
        {
            return ("completed",UIColor.blue)
        }
        else
        {
            return ("not completed",UIColor.red)
        }
    }
}

