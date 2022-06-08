//
//  SlidersCell.swift
//  SataFood
//
//  Created by abdrahman on 06/06/2022.
//

import UIKit

class SlidersCell: UICollectionViewCell {
    static let identifier = "SlidersCell"

    
    var sliderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.isUserInteractionEnabled = true
        control.pageIndicatorTintColor = .systemGray5
        control.numberOfPages = 4
        return control
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //contentView.backgroundColor = .yellow
        contentView.layer.cornerRadius = 15
        contentView.addSubview(sliderImage)
        contentView.addSubview(pageControl)
        sliderImage.layer.cornerRadius = 20
        sliderImage.clipsToBounds = true
        sliderImage.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: pageControl.topAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        
        pageControl.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, height: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configCell(_ vm: SliderCellVM){
        let urlString = "http://satafood.codesroots.com:3000/" + vm.photo
        let url = URL(string: urlString)
        //self.categoryNameLbl.text = name
        do{
            self.sliderImage.image = try UIImage(data: Data(contentsOf: url!))
        }catch{
            print(error)
        }
        
    }
}
