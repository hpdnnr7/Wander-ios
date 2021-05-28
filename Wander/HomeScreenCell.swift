//
//  HomeScreenCell.swift
//  Wander
//
//  Created by Hope Dunner on 5/27/21.
//
import Foundation
import UIKit
import Parse


class HomeScreenCell: UITableViewCell {
    
    


    
    @IBOutlet weak var labelnameEvent: UILabel!
    
    @IBOutlet weak var labelimageEvent: UIImageView!
    
    @IBOutlet weak var labelcategoryEvent: UILabel!
    
    @IBOutlet weak var labelnumber: UILabel!
    

  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
