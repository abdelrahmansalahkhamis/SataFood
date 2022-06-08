//
//  PageControlCell.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import UIKit
import Combine

class FooterView: UICollectionReusableView {
    
    static let identifier = "FooterView"

    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.isUserInteractionEnabled = true
        control.currentPageIndicatorTintColor = .systemOrange
        control.pageIndicatorTintColor = .systemGray5
        control.numberOfPages = 4
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(pageControl)
        pageControl.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

