//
//  ViewController.swift
//  MyCourse
//
//  Created by Karl Revilla on 23/8/2023.
//

import UIKit

class FeaturedViewController: UIViewController {
    // MARK: Background
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Background01")
        view.contentMode = .bottomRight
        
        return view
    }()
    
    // MARK: ScrollView
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = true
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Banner
    let bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BlurBackground")
        
        
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        
        view.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 20
        
        return view
    }()
    
    let bannerBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let contentBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let view = UIVisualEffectView(effect: vibrancyEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let bannerTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannerBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannerImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Illustration 2")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let bannerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SwiftUI for iOS 15"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    let bannerSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 SECTIONS - 3 HOURS"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let bannerDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Build an iOS app for iOS 15 with custom layouts, animations, and more!"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: Recent Handbooks
    let recentHandbooksLabel: UILabel = {
        let label = UILabel()
        label.text = "RECENT HANDBOOKS"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.secondaryLabel
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HandbookCell.self, forCellWithReuseIdentifier: HandbookCell.identifier)
        
        return collectionView
    }()
    
    
    // MARK: Recent Courses
    let recentCoursesLabel: UILabel = {
        let label = UILabel()
        label.text = "RECENT COURSES"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.secondaryLabel
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CourseTableCell.self, forCellReuseIdentifier: CourseTableCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "PrimaryBackground")
        title = "Featured"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureScrollView()
        configureBanner()
        configureRecentHandbooks()
        configureCourses()
     
        view.layoutIfNeeded()
    }
    
    
    // MARK: Configure Scroll View
    func configureScrollView() {
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let contentHeightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentHeightAnchor.isActive = true
        contentHeightAnchor.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
    }
    
    // MARK: Configure Banner
    func configureBanner() {
        scrollView.addSubview(bannerView)
        
        let bannerViewLeadingAnchor = bannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        bannerViewLeadingAnchor.priority = UILayoutPriority(999)
        
        let bannerViewTrailingAnchor = bannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        bannerViewTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            bannerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bannerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 350),
            bannerView.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
            bannerViewLeadingAnchor,
            bannerViewTrailingAnchor,
        ])
        
        print(bannerView.frame)
        
        bannerView.addSubview(bannerBlurView)
        
        NSLayoutConstraint.activate([
            bannerBlurView.topAnchor.constraint(equalTo: bannerView.topAnchor),
            bannerBlurView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor),
            bannerBlurView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            bannerBlurView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
        ])

        bannerView.addSubview(contentBlurView)

        NSLayoutConstraint.activate([
            contentBlurView.topAnchor.constraint(equalTo: bannerView.topAnchor),
            contentBlurView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor),
            contentBlurView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            contentBlurView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
        ])

        bannerView.addSubview(bannerImage)

        contentBlurView.contentView.addSubview(bannerBottomView)

        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: bannerView.topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 16),
            bannerImage.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -16),

            bannerBottomView.topAnchor.constraint(equalTo: bannerImage.bottomAnchor),
            bannerBottomView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            bannerBottomView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            bannerBottomView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
        ])

        bannerBottomView.addSubview(bannerTitle)
        bannerBottomView.addSubview(bannerSubtitle)
        bannerBottomView.addSubview(bannerDescription)

        NSLayoutConstraint.activate([
            bannerTitle.topAnchor.constraint(equalTo: bannerBottomView.topAnchor),
            bannerTitle.leadingAnchor.constraint(equalTo: bannerBottomView.leadingAnchor, constant: 16),
            bannerTitle.trailingAnchor.constraint(equalTo: bannerBottomView.trailingAnchor, constant: -16),

            bannerSubtitle.topAnchor.constraint(equalTo: bannerTitle.bottomAnchor, constant: 8),
            bannerSubtitle.leadingAnchor.constraint(equalTo: bannerBottomView.leadingAnchor, constant: 16),

            bannerDescription.topAnchor.constraint(equalTo: bannerSubtitle.bottomAnchor, constant: 8),
            bannerDescription.leadingAnchor.constraint(equalTo: bannerBottomView.leadingAnchor, constant: 16),
            bannerDescription.trailingAnchor.constraint(equalTo: bannerBottomView.trailingAnchor, constant: -16),
            bannerDescription.bottomAnchor.constraint(equalTo: bannerBottomView.bottomAnchor, constant: -40)
        ])
    }
    
    func configureRecentHandbooks() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        scrollView.addSubview(recentHandbooksLabel)
        
        NSLayoutConstraint.activate([
            recentHandbooksLabel.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 35),
            recentHandbooksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recentHandbooksLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
        ])
        
        collectionView.isScrollEnabled = false
        scrollView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: recentHandbooksLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 257),
        ])
    }
    
    func configureCourses() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.isScrollEnabled = false
        
        scrollView.addSubview(recentCoursesLabel)
        scrollView.addSubview(tableView)
        
        var totalHeight: CGFloat = 0
        
        for section in 0..<tableView.numberOfSections {
            for row in 0..<tableView.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)
                totalHeight += tableView.rectForRow(at: indexPath).size.height
            }
            
            if let headerView = tableView.headerView(forSection: section) {
                totalHeight += headerView.frame.size.height
            }
            
            if let footerView = tableView.footerView(forSection: section) {
                totalHeight += footerView.frame.size.height
            }
        }
        
        NSLayoutConstraint.activate([
            recentCoursesLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 16),
            recentCoursesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            recentCoursesLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: recentCoursesLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: totalHeight),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
        ])
    }
}


extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var handbookCardWidth: CGFloat {
        150
    }
    
    var handbookCardHeight: CGFloat {
        257
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HandbookCell.identifier, for: indexPath) as! HandbookCell
        let handbook = handbooks[indexPath.item]
        
        cell.containerView.frame = CGRect(x: 0, y: 0, width: handbookCardWidth, height: handbookCardHeight)
        cell.cellTitle.text = handbook.courseTitle
        cell.cellSubtitle.text = handbook.courseSubtitle
        cell.cellDescription.text = handbook.courseDescription
        cell.gradientLayer.colors = handbook.courseGradient
        cell.imageView.image = handbook.courseBanner
        cell.logoView.image = handbook.courseIcon
        
        cell.configure()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: handbookCardWidth, height: handbookCardHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    var tableCardSize: CGFloat {
        350
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableCell.identifier, for: indexPath) as! CourseTableCell
        let course = courses[indexPath.section]
        
        cell.selectionStyle = .none
        cell.courseBackground.image = course.courseBackground
        cell.courseImage.image = course.courseBanner
        cell.courseTitle.text = course.courseTitle
        cell.courseSubtitle.text = course.courseSubtitle
        cell.courseDescription.text = course.courseDescription
        cell.configureUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCardSize
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let course = courses[indexPath.section]
        
        print(course)
//        performSegue(withIdentifier: "popupCourse", sender: course)
    }
}

