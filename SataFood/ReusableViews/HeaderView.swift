//
//  HeaderView.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "HeaderView"

    var headerTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "======"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .yellow
        addSubview(headerTitleLbl)
        headerTitleLbl.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 15)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configTitle(_ text: String){
        headerTitleLbl.text = text
    }
//    var title:String?{
//        didSet{
//            //pageControl.text = title Enjoy the largest selection of restaurants and offers
//        }
//    }
}
