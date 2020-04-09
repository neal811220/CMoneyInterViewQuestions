//
//  FetchPhotosProvider.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/9.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

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
    
    func imageURLTransformImage(paging: Int, photoURLString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let imageURL = URL(string: photoURLString) else {
            
            completion(.failure(NAHTTPClientError.URLError))
            return
        }
        
        URLSession.shared.delegateQueue.maxConcurrentOperationCount = 40
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                return
            }
            
            guard let image = UIImage(data: data) else {
                
                return
            }
            
            completion(.success(image))
            
        }.resume()
    }
}
