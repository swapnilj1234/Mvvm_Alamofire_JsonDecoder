//
//  UserCell.swift
//  Mvvm_Alamofire_JsonDecoder
//
//  Created by swapnil jadhav on 12/06/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    var modelUser: UserModel?{
        didSet{
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration()
    {
        let status = modelUser?.getStatusColor()
        lblStatus.text = status?.0
        lblStatus.backgroundColor = status?.1
        
        if let id = modelUser?.id
        {
            lblID.text = "\(id)"
        }
        else
        {
            lblID.text = "no id"
        }
        lblTitle.text = modelUser?.title
    }
    
}
