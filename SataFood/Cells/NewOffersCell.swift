//
//  NewOffersCell.swift
//  SataFood
//
//  Created by abdrahman on 06/06/2022.
//

import UIKit

class NewOffersCell: UICollectionViewCell {
    static let identifier = "NewOffersCell"
    
    var offerNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "======"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var cuisinesLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var openStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "open now"
        lbl.textColor = .green
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .center
        return lbl
    }()
    var categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    var descriptionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tag")
        return imageView
    }()
    
    var descriptionNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "======"
        lbl.textColor = .orange
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 5
        return lbl
    }()
    
    var descriptionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 255, green: 198, blue: 186, alpha: 1)
        return view
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        let containerStack = UIStackView()
        let descriptionStack = UIStackView()
        let nameStack = UIStackView()
        
        containerStack.addArrangedSubview(categoryImage)
        containerStack.addArrangedSubview(nameStack)
        containerStack.addArrangedSubview(cuisinesLbl)
        containerStack.addArrangedSubview(descriptionView)
        containerStack.axis = .vertical
        containerStack.distribution = .fill
        containerStack.spacing = 10
        categoryImage.layer.cornerRadius = 15
        categoryImage.clipsToBounds = true
        contentView.addSubview(containerStack)
        containerStack.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 15)
        
        descriptionNameLbl.setHeight(height: 30)
        cuisinesLbl.setHeight(height: 20)
        offerNameLbl.setHeight(height: 20)
        
        descriptionView.addSubview(descriptionStack)
        descriptionView.setHeight(height: 40)
        descriptionStack.anchor(top: descriptionView.topAnchor, left: descriptionView.leftAnchor, bottom: descriptionView.bottomAnchor, right: descriptionView.rightAnchor, paddingTop: 8, paddingLeft: 10, paddingBottom: 8, paddingRight: 10)
        descriptionStack.addArrangedSubview(descriptionNameLbl)
        descriptionStack.addArrangedSubview(descriptionImage)
        descriptionStack.axis = .horizontal
        descriptionStack.distribution = .fillProportionally
        descriptionStack.spacing = 10
        descriptionImage.setHeight(height: 20)
        descriptionImage.setWidth(width: 20)
        
        nameStack.addArrangedSubview(offerNameLbl)
        nameStack.addArrangedSubview(openStatusLbl)
        nameStack.axis = .horizontal
        nameStack.distribution = .equalSpacing
        nameStack.setHeight(height: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configCell(_ vm: NewOfferCellVM){
        
        self.offerNameLbl.text = vm.name
        self.descriptionNameLbl.text = vm.newofferDescription
        for item in vm.cuisines{
            self.cuisinesLbl.text! += "\(item.name ?? "" )"
            self.cuisinesLbl.text! += " - "
        }
        cuisinesLbl.text = String(cuisinesLbl.text!.dropLast())
        cuisinesLbl.text = String(cuisinesLbl.text!.dropLast())
        let urlString = "http://satafood.codesroots.com:3000/" + vm.cover
        let url = URL(string: urlString)
        do{
            self.categoryImage.image = try UIImage(data: Data(contentsOf: url!))
        }catch{
            print(error)
        }
    }
}
