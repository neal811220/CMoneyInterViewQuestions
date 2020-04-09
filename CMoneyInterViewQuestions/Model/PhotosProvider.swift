//
//  FetchPhotosProvider.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/9.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

class PhotosProvider {
    
    func fetchPhotos(completion: @escaping (Result<[Photos], Error>) -> Void) {
        
        HTTPClient.shared.request(PhotoRequest.fetchPhotos) { result in
            
            switch result {
                
            case .success(let data):
                
                do {
                    
                    let photoData = try JSONDecoder().decode([Photos].self, from: data)
                    
                    completion(.success(photoData))
                    
                } catch {
                    
                    completion(.failure(error))
                }
                
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
