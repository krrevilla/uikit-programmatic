//
//  Handbooks.swift
//  MyCourse
//
//  Created by Karl Revilla on 30/8/2023.
//

import UIKit

class HandbooksCollection: UIView {
    var data: [Course] = []
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Handbooks"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.secondaryLabel
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HandbookCell.self, forCellWithReuseIdentifier: HandbookCell.identifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 257),
        ])
    }
}


extension HandbooksCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var handbookCardWidth: CGFloat {
        150
    }
    
    var handbookCardHeight: CGFloat {
        257
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HandbookCell.identifier, for: indexPath) as! HandbookCell
        let handbook = self.data[indexPath.item]
        
        cell.containerView.frame = CGRect(x: 0, y: 0, width: handbookCardWidth, height: handbookCardHeight)
        cell.cellTitle.text = handbook.courseTitle
        cell.cellSubtitle.text = handbook.courseSubtitle
        cell.cellDescription.text = handbook.courseDescription
        cell.gradientLayer.colors = handbook.courseGradient
        cell.imageView.image = handbook.courseBanner
        cell.logoView.image = handbook.courseIcon
        
        cell.setupUI()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: handbookCardWidth, height: handbookCardHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
