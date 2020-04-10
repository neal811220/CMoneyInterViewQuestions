//
//  ContentDetailViewController.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ContentDetailViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        
        tableView.registerContentDetailCell(tableView: tableView)
                
        return tableView
        
    }()
    
    let photoProvider = PhotosProvider()
    
    let activityView = UIActivityIndicatorView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupTableView()
        
        setupActivityView()
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        
        tableView.anchor(
            
            top: view.topAnchor,
            
            bottom: view.bottomAnchor,
            
            left: view.leftAnchor,
            
            right: view.rightAnchor
        )
    }
    
    func setupActivityView() {
        
        view.addSubview(activityView)
        
        activityView.anchor(
            
            centerX: view.centerXAnchor,
            
            centerY: view.centerYAnchor,
            
            width: view.frame.width / 10,
            
            height: view.frame.width / 10
        )
    }
    
}

extension ContentDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ContentDetailTableViewCell.identifier),
            for: indexPath) as? ContentDetailTableViewCell
            else {
            return UITableViewCell()
        }
        
        guard let currentIndexPath = PhotoDataManager.shared.currentIndexPath else {
            
            return UITableViewCell()
        }
        
        cell.idLabel.text = "ID: \(String(PhotoDataManager.shared.currentPhotos[currentIndexPath.row].id))"
        
        cell.titleLabel.text = "Title: \(PhotoDataManager.shared.currentPhotos[currentIndexPath.row].title)"
        
        DispatchQueue.main.async {
            
            self.activityView.startAnimating()
            
        }
        
        photoProvider.imageURLTransformImage(paging: currentIndexPath.row, photoURLString: PhotoDataManager.shared.currentPhotos[currentIndexPath.row].url) { result in
            
            switch result {
                
            case .success(let photo):
                
                DispatchQueue.main.async {
                    
                    cell.thumbnailView.image = photo
                    
                }
                
            case .failure(let error):
                
                print(error)
            }
            
            DispatchQueue.main.async {
                
                self.activityView.stopAnimating()
            }
        }
        
        return cell
    }
}
