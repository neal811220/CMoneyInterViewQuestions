//
//  ContentDetailTableViewCell.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ContentDetailTableViewCell: UITableViewCell {

    let thumbnailView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupThumbnailView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupThumbnailView() {
        
        self.addSubview(thumbnailView)
        
        thumbnailView.anchor(
            
            top: self.topAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            height: self.frame.height / 2
        )
    }
}
