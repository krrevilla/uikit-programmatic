//
//  Handbooks.swift
//  MyCourse
//
//  Created by Karl Revilla on 30/8/2023.
//

import UIKit

class Handbooks: UIView {
    var data: [Course] = []
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Handbooks"
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
    
//    init(data: [Course] = []) {
//        self.data = data
//
//        self.addSubview(label)
//        self.addSubview(collectionView)
//
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
//            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
//        ])
//    }
}


extension Handbooks: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: handbookCardWidth, height: handbookCardHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
