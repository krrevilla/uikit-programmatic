//
//  ExploreViewController.swift
//  MyCourse
//
//  Created by Karl Revilla on 25/8/2023.
//

import UIKit

class ExploreViewController: UIViewController {
    private var lastScrollYPosition: CGFloat = 0
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Background02")
        view.contentMode = .scaleAspectFill
        return view
    }()
    let headerBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .blue
        return label
    }()
    
    // MARK: ScrollView
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topicsLabel: UILabel = {
        let label = UILabel()
        label.text = "TOPICS"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.secondaryLabel
        return label
    }()
    let tableViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 30
        return view
    }()
    let tableBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 30
        return view
    }()
    let tableView: SelfSizedTable = {
        let view = SelfSizedTable()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TopicCell.self, forCellReuseIdentifier: TopicCell.identifier)
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        return view
    }()
    
    // MARK: Popular
    let popularCollection: HandbooksCollection = {
        let view = HandbooksCollection()
        view.data = handbooks
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "POPULAR"
        return view
    }()
    
    
    let recentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SectionCollectionCell.self, forCellWithReuseIdentifier: SectionCollectionCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 16)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "PrimaryBackground")
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        configureScrollView()
        configureRecent()
        configureTopics()
        configurePopular()
        configureHeader()
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let contentHeightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentHeightAnchor.isActive = true
        contentHeightAnchor.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
    }
    
    func configureHeader() {
        view.addSubview(headerView)
        view.addSubview(headerBlurView)
        view.addSubview(headerLabel)
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            headerBlurView.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerBlurView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerBlurView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerBlurView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            headerLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: headerBlurView.bottomAnchor, constant: -16)
        ])
    }
    
    func configureRecent() {
        recentCollection.delegate = self
        recentCollection.dataSource = self
        self.view.addSubview(recentCollection)
        
        NSLayoutConstraint.activate([
            recentCollection.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 60),
            recentCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recentCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recentCollection.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    func configureTopics() {
        tableView.delegate = self
        tableView.dataSource = self
        
        contentView.addSubview(topicsLabel)
        contentView.addSubview(tableViewContainer)
        tableViewContainer.addSubview(tableBlurView)
        tableViewContainer.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            topicsLabel.topAnchor.constraint(equalTo: recentCollection.bottomAnchor, constant: 16),
            topicsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            topicsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            tableViewContainer.topAnchor.constraint(equalTo: topicsLabel.bottomAnchor, constant: 16),
            tableViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            tableBlurView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor),
            tableBlurView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor),
            tableBlurView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor),
            tableBlurView.bottomAnchor.constraint(equalTo: tableViewContainer.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: tableViewContainer.bottomAnchor),
        ])
    }
    
    func configurePopular() {
        contentView.addSubview(popularCollection)
        
        NSLayoutConstraint.activate([
            popularCollection.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 16),
            popularCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            popularCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            popularCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
        ])
    }
}


extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopicCell.identifier, for: indexPath) as! TopicCell
        let topic = topics[indexPath.section]
        
        cell.icon.image = UIImage(systemName: topic.topicSymbol)
        cell.label.text = topic.topicName
        
        if indexPath.section == topics.count - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width, bottom: 0, right: 0)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var handbookCellWidth: CGFloat {
        150
    }
    
    private var handbookCellHeight: CGFloat {
        257
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCollectionCell.identifier, for: indexPath) as! SectionCollectionCell
        let section = sections[indexPath.item]
        
        cell.bannerImage.image = section.sectionBanner
        cell.icon.image = section.sectionIcon
        cell.sectionTitle.text = section.sectionTitle
        cell.sectionSubtitle.text = section.sectionSubtitle
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset: CGFloat = 16 // Adjust this value based on your preference
//
//        if section == 0 {
//            // Add leading space to the first item in the first section
//            return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
//        } else if section == collectionView.numberOfSections - 1 {
//            // Add trailing space to the last item in the last section
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: inset)
//        } else {
//            return UIEdgeInsets.zero
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2.2, height: 230)
    }
}
