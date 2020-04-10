//
//  APIContentCollectionViewCell.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class APIContentCollectionViewCell: UICollectionViewCell {

    let thumbnailView: UIImageView = {
        
        let imageView = UIImageView()
                
        return imageView
    }()
    
    let idLabel: UILabel = {
        
        let label = UILabel()
                        
        return label
    }()
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
                        
        label.textAlignment = .center
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupThumbnailView()
        
        setupIDLabel()
        
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.thumbnailView.image = nil
    }
    
    func setupThumbnailView() {
           
           self.addSubview(thumbnailView)
           
           thumbnailView.anchor(
               
               top: self.topAnchor,
               
               bottom: self.bottomAnchor,
               
               left: self.leftAnchor,
               
               right: self.rightAnchor
           )
       }
    
    func setupIDLabel() {
        
        self.addSubview(idLabel)
        
        idLabel.anchor(centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingCenterY: -self.frame.height / 4)
    }
    
    func setupTitleLabel() {
        
        self.addSubview(titleLabel)
        
        titleLabel.anchor(
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            centerY: self.centerYAnchor,
            
            paddingCenterY: self.frame.height / 4
        )
    }
}
