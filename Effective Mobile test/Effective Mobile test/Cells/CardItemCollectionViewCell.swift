//
//  CardItemCollectionViewCell.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 09.12.2022.
//

import UIKit
import SnapKit

class CardItemCollectionViewCell: UICollectionViewCell {
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.setupCornerRadius(10)
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        label.font = UIFont(name: "MarkPro", size: 16)
        label.textColor = .white
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 20)
        label.textColor = .appTestColor
        return label
    }()
    
    let qtyStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .center
        stack.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.262745098, alpha: 1)
        stack.clipsToBounds = true
        stack.setupCornerRadius(13)
        return stack
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let qtyLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "delete"), for: .normal)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupProperties()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(picture)
        contentView.addSubview(title)
        contentView.addSubview(price)
        contentView.addSubview(qtyStack)
        contentView.addSubview(deleteButton)
        

        picture.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(picture.snp.height)
        }
        
        price.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(picture.snp.trailing).inset(-10)
            make.height.equalTo(26)
            make.trailing.equalTo(qtyStack.snp.leading).inset(10)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.leading.equalTo(picture.snp.trailing).inset(-10)
            make.bottom.equalTo(price.snp.top).inset(-5)
            make.trailing.equalTo(qtyStack.snp.leading).inset(-10)
        }
        
        qtyStack.snp.makeConstraints { make in
            make.trailing.equalTo(deleteButton.snp.leading).inset(-17)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(26)
        }

        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.height.width.equalTo(28)
            make.centerY.equalTo(qtyStack)
        }
        
    }
    
    private func setupProperties() {
        qtyStack.addArrangedSubview(plusButton)
        qtyStack.addArrangedSubview(qtyLabel)
        qtyStack.addArrangedSubview(minusButton)
    }
    
    private func requetsPicture(pictureUrl: String) {
            let url = URL(string: pictureUrl)
            picture.sd_setImage(with: url)
    }
    
    func setupData(basket: BasketItem) {
        price.text = "$\(basket.price)"
        title.text = basket.title
        
        requetsPicture(pictureUrl: basket.images)
    }
}
