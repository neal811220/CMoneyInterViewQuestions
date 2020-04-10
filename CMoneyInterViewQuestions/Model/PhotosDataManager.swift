//
//  PhotosDataManager.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/10.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

class PhotoDataManager {
    
    static let shared = PhotoDataManager()
    
    private init () {}
    
    var photos: [Photos] = []
    
    var currentPhotos: [Photos] = []
    
    var currentIndexPath: IndexPath?
    
    var isFetchAll = false
    
}
