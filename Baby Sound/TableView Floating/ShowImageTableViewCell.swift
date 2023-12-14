//
//  ShowImageTableViewCell.swift
//  Baby Sound
//
//  Created by MacBookAir_36 on 21/08/23.
//

import UIKit

class ShowImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var ImgBackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ImgBackView.layer.masksToBounds = true
        self.ImgBackView.layer.cornerRadius = 25
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
