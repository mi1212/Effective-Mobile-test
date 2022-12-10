//
//  HotSalesCollectionViewCell.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import UIKit
import SDWebImage
import SnapKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 30)
        label.textColor = .white
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Buy now!", for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font =  UIFont(name: "SFProDisplay-Regular", size: 16)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let newView: UIView = {
        let view = UIView()
        view.backgroundColor = .appTestColor
        view.clipsToBounds = true
        return view
    }()
    
    let newLabel: UILabel = {
        let label = UILabel()
        label.text = "New"
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    
    var isBuy: Bool?
    
    var isNew: Bool?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(picture)
        contentView.addSubview(buyButton)
        contentView.addSubview(subTitle)
        contentView.addSubview(title)
        

        picture.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buyButton.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(32)
            make.height.equalToSuperview().multipliedBy(0.14)
            make.width.equalToSuperview().multipliedBy(0.25)
        }

        subTitle.snp.makeConstraints { make in
            make.bottom.equalTo(buyButton.snp.top).inset(-26)
            make.leading.equalTo(buyButton)
            make.height.equalTo(13)
        }

        title.snp.makeConstraints { make in
            make.bottom.equalTo(subTitle.snp.top).inset(-5)
            make.leading.equalTo(buyButton)
            make.height.equalTo(26)
        }
        
    }
    
    func setupNewLabel() {
        if let bool = isNew {
            if bool {
                contentView.addSubview(newView)
                newView.addSubview(newLabel)

                newView.snp.makeConstraints { make in
                    make.top.equalToSuperview().inset(23)
                    make.leading.equalToSuperview().inset(32)
                    make.height.equalToSuperview().multipliedBy(0.15)
                    make.width.equalTo(newView.snp.height)
                }
                
                newLabel.snp.makeConstraints { make in
                    make.center.equalTo(newView)
                }                
            }
        }
    }
    
    private func requetsPicture(pictureUrl: String) {
            let url = URL(string: pictureUrl)
            picture.sd_setImage(with: url)
    }
    
    func setupData(hotSales: HomeStore) {
        self.title.text = hotSales.title
        self.subTitle.text = hotSales.subtitle
        self.isNew = hotSales.isNew
        self.isBuy = hotSales.isBuy
        requetsPicture(pictureUrl: hotSales.picture)
        setupNewLabel()
    }
    
}
