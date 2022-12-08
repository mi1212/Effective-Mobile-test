//
//  CategoryCollectionViewCell.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 08.12.2022.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let title = UILabel()
    
    var picture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.image = image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.orange
        return image
    }()
 
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
        contentView.addSubview(title)
        contentView.addSubview(picture)

        picture.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
        }
    }
    
}
