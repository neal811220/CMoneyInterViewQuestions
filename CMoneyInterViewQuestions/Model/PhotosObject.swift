//
//  PhotosObject.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/9.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct Photos: Codable {
    
    let albumId: Int
    
    let id: Int
    
    let title: String
    
    let url: String
    
    let thumbnailUrl: String
}
