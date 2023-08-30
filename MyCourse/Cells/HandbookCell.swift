//
//  HandbookCell.swift
//  MyCourse
//
//  Created by Karl Revilla on 23/8/2023.
//

import UIKit

class HandbookCell: UICollectionViewCell {
    static let identifier = "HandbookCell"
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear]
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        return layer
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Illustration 4")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    let logoView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Logo SwiftUI")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor(red: 24, green: 32, blue: 77, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let containerBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let contentBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: .fill)
        let view = UIVisualEffectView(effect: vibrancyEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SwiftUI Handbook"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let cellSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "80 sections - 9 hours"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()
    
    let cellDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Build an iOS app for iOS 15 with custom layouts, animations, and more!"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    let cellProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        progressView.progressTintColor = .white
        return progressView
    }()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
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
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        gradientLayer.frame = containerView.frame
        containerView.layer.insertSublayer(gradientLayer, at: 0)
        
        containerView.addSubview(containerBlurView)
        
        NSLayoutConstraint.activate([
            containerBlurView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerBlurView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerBlurView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerBlurView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        containerView.addSubview(contentBlurView)

        NSLayoutConstraint.activate([
            contentBlurView.topAnchor.constraint(equalTo: containerView.topAnchor),
            contentBlurView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            contentBlurView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentBlurView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        containerView.addSubview(topView)

        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            topView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            topView.heightAnchor.constraint(equalToConstant: 90)
        ])

        imageView.frame = topView.frame
        topView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
        ])
        
        topView.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            logoView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            logoView.leadingAnchor.constraint(equalTo: topView.leadingAnchor)
        ])

        contentBlurView.contentView.addSubview(cellTitle)
        contentBlurView.contentView.addSubview(cellSubtitle)
        contentBlurView.contentView.addSubview(cellDescription)

        containerView.addSubview(cellProgressView)

        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8),
            cellTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cellTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            cellSubtitle.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 8),
            cellSubtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cellSubtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            cellDescription.topAnchor.constraint(equalTo: cellSubtitle.bottomAnchor, constant: 8),
            cellDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cellDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            cellProgressView.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: 8),
            cellProgressView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cellProgressView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cellProgressView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    override func prepareForReuse() {
        self.prepareForReuse()
    }
}
