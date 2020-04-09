//
//  PhotosRequest.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/9.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

enum PhotoRequest: NARequest {
    
    case fetchPhotos
    
    var headers: [String : String] {
        
        switch self {
            
        case .fetchPhotos:
            
            return [
                NAHTTPHeaderField.contentType.rawValue : NAHTTPHeaderValue.json.rawValue
            ]
            
        default:
            
            break
        }
    }
    
    var body: Data? {
        
        switch self {
            
        case .fetchPhotos:
            
            return nil
            
        default:
            
            break
        }
    }
    
    var method: String {
        
        switch self {
            
        case .fetchPhotos:
            
            return NAHTTPMethod.GET.rawValue
            
        default:
            
            break
        }
    }
    
    var endPoint: String {
        
        switch self {
            
        case .fetchPhotos:
            
            return "/photos"
            
        default:
            
            break
            
        }
    }
    
}
