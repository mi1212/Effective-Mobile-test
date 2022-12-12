//
//  TabItemView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import SnapKit

final class TabItemView: UIView {
    private let contentView = UIView()
    private let iconImageView = UIImageView()
    private let labelView = UILabel()
    var badgeView = UILabel()
    let index: Int
    
    var isSelected = false {
        didSet {
            animateItems()
        }
    }
    
    private let item: TabItem
    
    init(with item: TabItem, index: Int, label: String, badge: String) {
        
        self.item = item
        self.index = index
        super.init(frame: .zero)
        self.labelView.text = label
        self.badgeView.text = badge
        setupLayout()
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(contentView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(labelView)
        contentView.addSubview(badgeView)
        iconImageView.image = isSelected ? item.selectedIcon : item.icon


        

        
        if labelView.text != "" {
            
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            iconImageView.snp.makeConstraints { make in
                make.width.height.equalTo(30)
                make.centerY.equalTo(contentView)
                make.bottom.top.equalTo(contentView)
            }
            
            labelView.snp.makeConstraints { make in
                make.leading.equalTo(iconImageView.snp.trailing).inset(8)
                make.top.bottom.equalTo(iconImageView)
                make.trailing.equalTo(contentView)
            }
        } else {
            
            contentView.snp.makeConstraints { make in
                make.width.height.equalTo(20)
                make.edges.equalToSuperview()
            }
            
            iconImageView.snp.makeConstraints { make in
                make.width.height.equalTo(20)
                make.center.equalToSuperview()
                make.bottom.top.equalTo(contentView)
            }
        }
    }
    
    func setupBadge(qtyOfItemsinCart: Int) {
        contentView.addSubview(badgeView)
        
        badgeView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(iconImageView)
            make.width.height.equalTo(12)
        }
        badgeView.text = "\(qtyOfItemsinCart)"
    }
    
    private func setupProperts() {
        
        badgeView.backgroundColor = .appTestColor
        badgeView.setupCornerRadius(8)
        badgeView.sizeToFit()
        badgeView.clipsToBounds = true
        badgeView.textAlignment = .center
        badgeView.textColor = .white
        badgeView.adjustsFontSizeToFitWidth = true
//        badgeView.font = UIFont(name: "MarkPro", size: 15)
        
        self.labelView.textColor = .white
//        self.labelView.adjustsFontSizeToFitWidth = true
        self.labelView.font = UIFont(name: "MarkPro", size: 12)
        self.labelView.minimumScaleFactor = 0.5
    }
    
    private func animateItems() {
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}
