//
//  SearchViewController.swift
//  appStore
//
//  Created by admin on 2019-04-25.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let cellID = "resultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.backgroundColor = .white
        fetchSearchResultApps()
        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        
        cell.contentView.layer.cornerRadius = 14
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    fileprivate func fetchSearchResultApps(){
        let urlStr = "https://itunes.apple.com/search?term=facebook&entity=software"
        guard let url = URL(string: urlStr) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed", err)
                return
            }
            guard let data = data else {return}
            do {
                let searchResult = try
                JSONDecoder().decode(searchResultApp.self, from: data)
                
                searchResult.results.forEach({(result)in
                    print(result.trackName, result.primaryGenreName)
                })
                
            }catch{
                print(" ", error)
            }
        }.resume()
    }
    
}
