//
//  DetailPropertsItem.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit

class DetailPropertsItem: UIView {

    private let contentView = UIView()
    private let imageView = UIImageView()
    private let labelView = UILabel()
    
    private let item: DetailProperts
    
    init(with item: DetailProperts, details: String) {
        
        self.item = item
        super.init(frame: .zero)
        self.imageView.image = item.image
        self.labelView.text = details
        setupLayout()
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(labelView)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.width.height.equalTo(28)
            make.centerX.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-8)
            make.leading.trailing.bottom.equalTo(contentView)
            make.height.equalTo(12)
        }

        
    }
    
    private func setupProperts() {
        self.imageView.contentMode = .scaleAspectFill
        self.labelView.textColor = .gray
        self.labelView.textAlignment = .center
        self.labelView.font = UIFont(name: "MarkPro", size: 11)
        self.labelView.adjustsFontSizeToFitWidth = true
        self.labelView.minimumScaleFactor = 0.5
    }

}
