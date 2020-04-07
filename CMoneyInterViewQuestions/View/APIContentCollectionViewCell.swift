//
//  APIContentCollectionViewCell.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class APIContentCollectionViewCell: UICollectionViewCell {

    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.textAlignment = .center
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupIDLabel()
        
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIDLabel() {
        
        self.addSubview(idLabel)
        
        idLabel.anchor(centerX: contentView.centerXAnchor, centerY: contentView.centerYAnchor)
    }
    
    func setupTitleLabel() {
        
        self.addSubview(titleLabel)
        
        titleLabel.anchor(
            bottom: contentView.bottomAnchor,
            left: contentView.leftAnchor,
            right: contentView.rightAnchor
        )
    }
}
