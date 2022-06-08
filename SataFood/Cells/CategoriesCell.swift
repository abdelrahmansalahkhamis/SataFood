//
//  CategoriesCell.swift
//  SataFood
//
//  Created by abdrahman on 06/06/2022.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    static let identifier = "CategoriesCell"
    
    var categoryNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "======"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var categoryImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 25
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryNameLbl)
        contentView.backgroundColor = UIColor(red: 255, green: 87, blue: 51, alpha: 1)
        
        categoryImage.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: categoryNameLbl.topAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        categoryNameLbl.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configCell(_ vm: CategoryCellVM){
        
        self.categoryNameLbl.text = vm.name
        let urlString = "http://satafood.codesroots.com:3000/" + vm.photo
        let url = URL(string: urlString)
        //self.categoryNameLbl.text = name
        do{
            self.categoryImage.image = try UIImage(data: Data(contentsOf: url!))
        }catch{
            print(error)
        }

    }
}
