//
//  SectionTableCell.swift
//  MyCourse
//
//  Created by Karl Revilla on 30/8/2023.
//

import UIKit

class SectionTableCell: UITableViewCell {
    static let identifier = "SectionTableCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Logo
    let iconOuterContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.cornerCurve = .continuous
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    let iconInnerContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.294, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        return view
    }()
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: Details
    let detailsSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    let detailsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let detailsDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: Progress View
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        progressView.progressTintColor = .white
        return progressView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        contentView.addSubview(containerView)

        containerView.addSubview(iconOuterContainer)
        iconOuterContainer.addSubview(iconInnerContainer)
        iconInnerContainer.addSubview(icon)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconOuterContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            iconOuterContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            iconOuterContainer.heightAnchor.constraint(equalToConstant: 60),
            iconOuterContainer.widthAnchor.constraint(equalTo: iconOuterContainer.heightAnchor),
            
            iconInnerContainer.centerXAnchor.constraint(equalTo: iconOuterContainer.centerXAnchor),
            iconInnerContainer.centerYAnchor.constraint(equalTo: iconOuterContainer.centerYAnchor),
            iconInnerContainer.heightAnchor.constraint(equalToConstant: 40),
            iconInnerContainer.widthAnchor.constraint(equalTo: iconInnerContainer.heightAnchor),
            
            icon.centerXAnchor.constraint(equalTo: iconInnerContainer.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: iconInnerContainer.centerYAnchor),
        ])
        
        containerView.addSubview(detailsSubtitle)
        containerView.addSubview(detailsTitle)
        containerView.addSubview(detailsDescription)
        containerView.addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            detailsSubtitle.topAnchor.constraint(equalTo: iconOuterContainer.topAnchor),
            detailsSubtitle.leadingAnchor.constraint(equalTo: iconOuterContainer.trailingAnchor),
            detailsSubtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            detailsTitle.topAnchor.constraint(equalTo: detailsSubtitle.bottomAnchor, constant: 8),
            detailsTitle.leadingAnchor.constraint(equalTo: iconOuterContainer.trailingAnchor),
            detailsTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            detailsDescription.topAnchor.constraint(equalTo: detailsTitle.bottomAnchor, constant: 8),
            detailsDescription.leadingAnchor.constraint(equalTo: iconOuterContainer.trailingAnchor),
            detailsDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            progressBar.topAnchor.constraint(equalTo: detailsDescription.bottomAnchor, constant: 8),
            progressBar.leadingAnchor.constraint(equalTo: iconOuterContainer.trailingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            progressBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
