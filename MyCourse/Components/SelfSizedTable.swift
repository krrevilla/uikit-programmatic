//
//  SelfSizedTable.swift
//  UIKit for iOS 15
//
//  Created by Karl Revilla on 30/8/2023.
//

import UIKit

class SelfSizedTable: UITableView {

    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
