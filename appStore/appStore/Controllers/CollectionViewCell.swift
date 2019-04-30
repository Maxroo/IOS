//
//  CollectionViewCell.swift
//  appStore
//
//  Created by admin on 2019-04-29.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let iconView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Instgram"
        return lb
    }()
    
    let categoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Photos & Viedeos"
        lb.textColor = #colorLiteral(red: 0.8160744025, green: 0.8268701425, blue: 0.8125088555, alpha: 1)
        
        return lb
    }()
    
    let ratingsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "991k"
        lb.textColor = #colorLiteral(red: 0.8160744025, green: 0.8268701425, blue: 0.8125088555, alpha: 1)

        return lb
    }()
    
    lazy var screenshot1: UIImageView = createScreenShotImageView()
    lazy var screenshot2: UIImageView = createScreenShotImageView()
    lazy var screenshot3: UIImageView = createScreenShotImageView()

    fileprivate func createScreenShotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.backgroundColor = .green
        iv.layer.cornerRadius = 8
        return iv
    }
    let getButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Get", for: .normal)
        butt.setTitleColor(.blue, for: .normal)
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize:14)
        butt.backgroundColor = UIColor(white: 0.95, alpha: 1)
        butt.widthAnchor.constraint(equalToConstant: 80).isActive = true
        butt.heightAnchor.constraint(equalToConstant: 32).isActive = true
        butt.layer.cornerRadius = 16
        return butt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let labelsSV = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsSV.axis = .vertical
        
        let topRowSV = UIStackView(arrangedSubviews: [iconView, labelsSV, getButton])
        topRowSV.spacing = 12
        topRowSV.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [
            screenshot2, screenshot1, screenshot3
            ])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let all = UIStackView(arrangedSubviews: [
            topRowSV, screenshotsStackView
            ])
        all.axis = .vertical
        all.spacing = 20
        
        addSubview(all)
        
        all.matchParent(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

