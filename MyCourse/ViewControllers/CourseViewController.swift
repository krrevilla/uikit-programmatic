//
//  CourseViewController.swift
//  MyCourse
//
//  Created by Karl Revilla on 29/8/2023.
//

import UIKit

class CourseViewController: UIViewController {
    
    var course: Course?
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = true
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let detailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        
        view.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 20
        
        return view
    }()
    let detailsOutsideBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    
    let detailsContentBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let view = UIVisualEffectView(effect: vibrancyEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let detailsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailsSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailsDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 1)
        return view
    }()
    
    let detailsAuthorImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.backgroundColor = UIColor(white: 1, alpha: 0.4)
        return view
    }()
    let detailsAuthorImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Avatar")
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        return view
    }()
    let detailsAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    let headerBackgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerBanner: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let menu = UIMenu(
            title: "Course Options",
            options: .displayInline,
            children: [
                UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in
                    
                }),
                UIAction(title: "Take Test", image: UIImage(systemName: "highlighter"), handler: { _ in
                    
                }),
                UIAction(title: "Download", image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in
                    
                }),
                UIAction(title: "Forums", image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"), handler: { _ in
                    
                })
            ]
        )
        
        button.showsMenuAsPrimaryAction = true
        button.menu = menu
        
        return button
    }()
    
    let blurredMenuView: UIVisualEffectView = {
        let blurredEffect = UIBlurEffect(style: .regular)
        let blurredView = UIVisualEffectView(effect: blurredEffect)
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        blurredView.layer.cornerRadius = 16
        blurredView.layer.cornerCurve = .continuous
        blurredView.layer.masksToBounds = true
        return blurredView
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        let closeIcon = UIImage(systemName: "xmark")
        button.setImage(closeIcon, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.tintColor = .black
        button.layer.cornerRadius = 16
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tableContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 32
        view.layer.cornerCurve = .continuous
        
        view.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 20
        
        return view
    }()
    let tableBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 32
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        
        return view
    }()
    let tableView: SelfSizedTable = {
        let view = SelfSizedTable()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SectionTableCell.self, forCellReuseIdentifier: SectionTableCell.identifier)
        
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 150
        
        view.bounces = false
        view.isScrollEnabled = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "PrimaryBackground")
        
        configureScrollView()

        if let course = self.course {
            configureMenuHeader(course)
            configureBanner(course)
            configureDetails(course)
            configureSections()
        }
    }
    
    // MARK: Configure Scroll View
    func configureScrollView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let contentHeightAnchor = contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
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
    
    // MARK: Header
    func configureMenuHeader(_ data: Course) {
        menuButton.setImage(data.courseIcon, for: .normal)
        closeButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        
        self.view.addSubview(blurredMenuView)
        blurredMenuView.contentView.addSubview(menuButton)
        self.view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            blurredMenuView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            blurredMenuView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            blurredMenuView.widthAnchor.constraint(equalToConstant: 44),
            blurredMenuView.heightAnchor.constraint(equalTo: blurredMenuView.widthAnchor),
            
            menuButton.centerXAnchor.constraint(equalTo: blurredMenuView.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: blurredMenuView.centerYAnchor),
            
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
        ])
    }
        
    func configureBanner(_ data: Course) {
        headerBackgroundImage.image = data.courseBackground
        headerBanner.image = data.courseBanner
        
        contentView.addSubview(headerBackgroundImage)
        contentView.addSubview(headerBanner)

        NSLayoutConstraint.activate([
            headerBackgroundImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            headerBackgroundImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            headerBackgroundImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            headerBanner.centerXAnchor.constraint(equalTo: headerBackgroundImage.centerXAnchor),
            headerBanner.centerYAnchor.constraint(equalTo: headerBackgroundImage.centerYAnchor),
        ])
    }
    
    func configureDetails(_ data: Course) {
        contentView.addSubview(detailsView)
        
        let detailsViewLeadingAnchor = detailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        detailsViewLeadingAnchor.priority = UILayoutPriority(999)
        
        let detailsViewTrailingAnchor = detailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        detailsViewTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: headerBanner.bottomAnchor, constant: -70),
            detailsView.leadingAnchor.constraint(equalTo: headerBanner.leadingAnchor, constant: 16),
            detailsView.trailingAnchor.constraint(equalTo: headerBanner.trailingAnchor, constant: -16),
            detailsView.heightAnchor.constraint(greaterThanOrEqualToConstant: 175),
            detailsView.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
            detailsViewLeadingAnchor,
            detailsViewTrailingAnchor
        ])
        
        detailsView.addSubview(detailsOutsideBlurView)
        NSLayoutConstraint.activate([
            detailsOutsideBlurView.topAnchor.constraint(equalTo: detailsView.topAnchor),
            detailsOutsideBlurView.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor),
            detailsOutsideBlurView.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor),
            detailsOutsideBlurView.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor)
        ])
        
        detailsView.addSubview(detailsContentBlurView)
        NSLayoutConstraint.activate([
            detailsContentBlurView.topAnchor.constraint(equalTo: detailsView.topAnchor),
            detailsContentBlurView.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor),
            detailsContentBlurView.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor),
            detailsContentBlurView.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor)
        ])
        
        detailsContentBlurView.contentView.addSubview(detailsTitle)
        detailsContentBlurView.contentView.addSubview(detailsSubtitle)
        detailsContentBlurView.contentView.addSubview(detailsDescription)
        detailsContentBlurView.contentView.addSubview(detailsAuthorLabel)
        
        detailsView.addSubview(divider)
        detailsView.addSubview(detailsAuthorImageView)
        detailsAuthorImageView.addSubview(detailsAuthorImage)
        
        detailsTitle.text = data.courseTitle
        detailsSubtitle.text = data.courseSubtitle
        detailsDescription.text = data.courseDescription
        
        if let courseAuthor = data.courseAuthor {
            let joined = courseAuthor.joined(separator: ", ")
            detailsAuthorLabel.text = "Taught by \(joined)"
        }
        
        NSLayoutConstraint.activate([
            detailsTitle.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 32),
            detailsTitle.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            detailsTitle.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
            
            detailsSubtitle.topAnchor.constraint(equalTo: detailsTitle.bottomAnchor, constant: 16),
            detailsSubtitle.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            detailsSubtitle.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
            
            detailsDescription.topAnchor.constraint(equalTo: detailsSubtitle.bottomAnchor, constant: 16),
            detailsDescription.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            detailsDescription.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
            
            divider.topAnchor.constraint(equalTo: detailsDescription.bottomAnchor, constant: 16),
            divider.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            detailsAuthorImageView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            detailsAuthorImageView.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            detailsAuthorImageView.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -16),
            detailsAuthorImageView.widthAnchor.constraint(equalToConstant: 50),
            detailsAuthorImageView.heightAnchor.constraint(equalToConstant: 50),
            
            detailsAuthorImage.centerXAnchor.constraint(equalTo: detailsAuthorImageView.centerXAnchor),
            detailsAuthorImage.centerYAnchor.constraint(equalTo: detailsAuthorImageView.centerYAnchor),
            detailsAuthorImage.widthAnchor.constraint(equalToConstant: 35),
            detailsAuthorImage.heightAnchor.constraint(equalToConstant: 35),
            
            detailsAuthorLabel.topAnchor.constraint(equalTo: detailsAuthorImageView.topAnchor),
            detailsAuthorLabel.leadingAnchor.constraint(equalTo: detailsAuthorImageView.trailingAnchor, constant: 16),
            detailsAuthorLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
            detailsAuthorLabel.bottomAnchor.constraint(equalTo: detailsAuthorImageView.bottomAnchor),
        ])
    }
    
    func configureSections() {
        tableView.delegate = self
        tableView.dataSource = self
        
        contentView.addSubview(tableContainer)
        tableContainer.addSubview(tableBlurView)
        tableContainer.addSubview(tableView)
        
        var totalHeight: CGFloat = 0


        for section in 0..<tableView.numberOfSections {
            print("Rows: \(tableView.numberOfRows(inSection: section))")

            for row in 0..<tableView.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)

                print("Index: \(indexPath), Size: \(tableView.rectForRow(at: indexPath).size.height)")

                totalHeight += tableView.rectForRow(at: indexPath).size.height
            }
        }
                
        NSLayoutConstraint.activate([
            tableContainer.topAnchor.constraint(equalTo: tableView.topAnchor),
            tableContainer.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            tableContainer.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            
            tableBlurView.topAnchor.constraint(equalTo: tableView.topAnchor),
            tableBlurView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            tableBlurView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableBlurView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
        ])
        
    }
    
    @objc func closePopup() {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension CourseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let course = self.course else {
            return 0
        }
        
        return course.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionTableCell.identifier, for: indexPath) as! SectionTableCell
        let section = self.course!.sections[indexPath.section]

        cell.icon.image = section.sectionIcon
        cell.detailsTitle.text = section.sectionTitle
        cell.detailsSubtitle.text = section.sectionSubtitle
        cell.detailsDescription.text = section.sectionDescription
                
        if indexPath.section == self.course!.sections.count - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width, bottom: 0, right: 0)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

