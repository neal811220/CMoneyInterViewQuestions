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
        
        imageView.image = UIImage(named: "92c952")
        
        return imageView
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID:"
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title:"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupThumbnailView()
        
        setupIDLabel()
        
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupThumbnailView()
        
        setupIDLabel()
        
        setupTitleLabel()
        
        fatalError("init(coder:) has not been implemented")
    }
    
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
            
            height: UIScreen.main.bounds.height / 2
        )
    }
    
    func setupIDLabel() {
        
        self.addSubview(idLabel)
        
        idLabel.anchor(
            
            top: thumbnailView.bottomAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            paddingTop: UIScreen.main.bounds.height / 20,
            
            paddingLeft: UIScreen.main.bounds.height / 20
        )
    }
    
    func setupTitleLabel() {
        
        self.addSubview(titleLabel)
        
        titleLabel.anchor(
            
            top: idLabel.bottomAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            paddingTop: UIScreen.main.bounds.height / 20,
            
            paddingLeft: UIScreen.main.bounds.height / 20
        )
    }

}
