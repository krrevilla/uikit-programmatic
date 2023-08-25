//
//  CourseTableCell.swift
//  MyCourse
//
//  Created by Karl Revilla on 24/8/2023.
//

import UIKit

class CourseTableCell: UITableViewCell {
    static let identifier = "CourseTableCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 20
        return view
    }()
    
    let courseBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Background 4")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerCurve = .continuous
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let courseLogoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let courseLogoBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let courseImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Illustration 1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let courseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let courseSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtitle"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let courseDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        self.addSubview(containerView)
        containerView.addSubview(courseBackground)
        
        let containerViewLeadingAnchor = containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        containerViewLeadingAnchor.priority = UILayoutPriority(999)

        let containerViewTrailingAnchor = containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        containerViewTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerViewLeadingAnchor,
            containerViewTrailingAnchor,
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 350),
            
            courseBackground.topAnchor.constraint(equalTo: containerView.topAnchor),
            courseBackground.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            courseBackground.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            courseBackground.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        containerView.addSubview(courseImage)
        containerView.addSubview(courseTitle)
        containerView.addSubview(courseSubtitle)
        containerView.addSubview(courseDescription)
        
        NSLayoutConstraint.activate([
            courseImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            courseImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            courseImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            courseTitle.topAnchor.constraint(equalTo: courseImage.bottomAnchor, constant: 0),
            courseTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            courseTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16),
            
            courseSubtitle.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 8),
            courseSubtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            courseSubtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16),
            
            courseDescription.topAnchor.constraint(equalTo: courseSubtitle.bottomAnchor, constant: 8),
            courseDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            courseDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            courseDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
}
