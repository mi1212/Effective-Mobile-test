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

    var bestSeller: BestSeller? {
        didSet {
            requetsPicture()
        }
    }
    
    let title = UILabel()
    
    let subTitle = UILabel()
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    
    let buyButton = UIButton()
    
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
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        backgroundColor = .backgroundColor
//    }
    
    private func setupCell() {
        contentView.addSubview(buyButton)
        contentView.addSubview(subTitle)
        contentView.addSubview(title)
        contentView.addSubview(picture)

        picture.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func requetsPicture() {
        if let picUrl = bestSeller?.picture {
            let url = URL(string: picUrl)
            picture.sd_setImage(with: url)
        }
    }
    
}
