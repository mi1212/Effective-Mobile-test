//
//  BestSellerCollectionViewCell.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import UIKit
import SDWebImage
import SnapKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        label.textColor = .appTestDarckColor
        return label
    }()
    
    let priceWithoutDiscount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 16)
        label.textColor = .appTestDarckColor
        return label
    }()
    
    let discountPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 13)
        label.textColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        return label
    }()
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    
    let likeButton: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 12.5
        return view
    }()
    
    let likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "likeLight")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    
    var isFavorites: Bool?
    
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
        contentView.addSubview(title)
        contentView.addSubview(priceWithoutDiscount)
        contentView.addSubview(discountPrice)

        title.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(21)
            make.trailing.equalToSuperview().inset(21)
            make.height.equalTo(16)
        }

        priceWithoutDiscount.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(21)
            make.height.equalTo(16)
            make.bottom.equalTo(title.snp.top).inset(-5)
        }

        discountPrice.snp.makeConstraints { make in
            make.leading.equalTo(priceWithoutDiscount.snp.trailing)
            make.trailing.equalToSuperview().inset(21)
            make.height.equalTo(16)
            make.centerY.equalTo(priceWithoutDiscount)
        }

        picture.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(priceWithoutDiscount.snp.top).inset(-2)
        }
        
        contentView.addSubview(likeButton)
        likeButton.addSubview(likeImage)

        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.trailing.equalTo(contentView).inset(12)
            make.height.width.equalTo(25)
        }
        
        likeImage.snp.makeConstraints { make in
            make.center.equalTo(likeButton)
            make.height.width.equalTo(likeButton).multipliedBy(0.4)
        }
        
    }
    
    private func requetsPicture(pictureUrl: String) {
            let url = URL(string: pictureUrl)
            picture.sd_setImage(with: url)
    }
    
    func setupData(bestSeller: BestSeller) {
        self.title.text = bestSeller.title
        
        self.priceWithoutDiscount.text = "$\(bestSeller.priceWithoutDiscount)"
        self.isFavorites = bestSeller.isFavorites
        
        if self.isFavorites ?? false {
            likeImage.image = UIImage(named: "like")
        } else {
            likeImage.image = UIImage(named: "likeLight")
        }
        
        requetsPicture(pictureUrl: bestSeller.picture)
        setupDiscountPrice(bestSeller.discountPrice)

    }
    
    private func setupDiscountPrice(_ discountPrice: Int) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(discountPrice)")
            attributeString.addAttribute(
                NSAttributedString.Key.strikethroughStyle,
                value: 2,
                range: NSRange(location: 0, length: attributeString.length)
            )
        self.discountPrice.attributedText = attributeString
    }
    
}
