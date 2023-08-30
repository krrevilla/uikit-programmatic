//
//  NotificationsViewController.swift
//  MyCourse
//
//  Created by Karl Revilla on 25/8/2023.
//

import UIKit

class NotificationsViewController: UIViewController {

    let pageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Notifications"
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
        view.addSubview(pageLabel)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.topAnchor),
            pageLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
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
