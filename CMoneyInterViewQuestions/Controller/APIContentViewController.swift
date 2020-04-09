//
//  APIContentViewController.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class APIContentViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.scrollDirection = .vertical
        
        collectionView.backgroundColor = UIColor.white
                
        collectionView.dataSource = self
        
        collectionView.delegate = self
                
        collectionView.registerAPIContentCell(collectionView: collectionView)
        
        return collectionView
    }()
    
    let photoProvider = PhotosProvider()
    
    let colorArray = ["red", "blue", "yellow", "black"]
    
    var datas: [Photos] = []
    
    var currentDatas: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupCollectionView()
        
        fetchPhotos()
        
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.anchor(
            
            top: view.topAnchor,
            
            bottom: view.bottomAnchor,
                            
            left: view.leftAnchor,
                              
            right: view.rightAnchor
        )
    }
    
    func fetchPhotos() {
        
        photoProvider.fetchPhotos { (result) in
            
            switch result {
                
            case .success(let data):
                
                self.datas = data
                
                for index in 0 ..< 40 {
                    
                    self.currentDatas.append(self.datas[index])
                }
                    
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                
                print(error)
                
            }
        }
    }
}

extension APIContentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: APIContentCollectionViewCell.self),
            for: indexPath) as? APIContentCollectionViewCell
            else {
                return UICollectionViewCell()
        }
        
        if indexPath.row > currentDatas.count - 10 {
            
            for index in currentDatas.count ..< currentDatas.count + 30 {
                
                currentDatas.append(datas[index])
                
            }
        }
        
        cell.idLabel.text = String(datas[indexPath.row].id)
        
        cell.titleLabel.text = datas[indexPath.row].title
        
        cell.tag = indexPath.row
                
        photoProvider.imageURLTransformImage(paging: indexPath.row, photoURLString: currentDatas[indexPath.row].thumbnailUrl) { (result) in
            
            switch result {
                
            case .success(let image):
                
                DispatchQueue.main.async {
                    
                    if cell.tag == indexPath.row {
                        
                        cell.thumbnailView.image = image
                        
                    }
                }
                
            case .failure(let error):
                
                print(error)
            }
            
        }
        
        return cell
    }
}

extension APIContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let contentDetailVC = Transitions.transitionsContentDetail()
        
        show(contentDetailVC, sender: nil)
    }
}

extension APIContentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
}
