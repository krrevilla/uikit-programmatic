//
//  SectionCollectionCell.swift
//  MyCourse
//
//  Created by Karl Revilla on 30/8/2023.
//

import UIKit

class SectionCollectionCell: UICollectionViewCell {
    static let identifier = "SectionCollectionCell"
    
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        return view
    }()
    
    let bannerImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 24, green: 32, blue: 77, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        view.layer.backgroundColor = UIColor(white: 1, alpha: 0.4).cgColor
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let playImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Play")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.294, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        return view
    }()
    let icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let sectionSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(containerView)
        containerView.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            blurView.topAnchor.constraint(equalTo: containerView.topAnchor),
            blurView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            blurView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
        containerView.addSubview(bannerImage)
        bannerImage.addSubview(playImage)
        bannerImage.addSubview(iconContainer)
        iconContainer.addSubview(icon)
        
        containerView.addSubview(sectionTitle)
        containerView.addSubview(sectionSubtitle)
        
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            bannerImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            bannerImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            bannerImage.heightAnchor.constraint(equalToConstant: 100),
            
            playImage.centerXAnchor.constraint(equalTo: bannerImage.centerXAnchor),
            playImage.centerYAnchor.constraint(equalTo: bannerImage.centerYAnchor),
            
            iconContainer.leadingAnchor.constraint(equalTo: bannerImage.leadingAnchor),
            iconContainer.bottomAnchor.constraint(equalTo: bannerImage.bottomAnchor),
            iconContainer.heightAnchor.constraint(equalToConstant: 25),
            iconContainer.widthAnchor.constraint(equalToConstant: 25),
            
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25),
            
            sectionSubtitle.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 8),
            sectionSubtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            sectionSubtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            sectionTitle.topAnchor.constraint(equalTo: sectionSubtitle.topAnchor, constant: 8),
            sectionTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            sectionTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            sectionTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
}
