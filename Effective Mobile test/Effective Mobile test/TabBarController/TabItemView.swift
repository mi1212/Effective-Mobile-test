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
    
    let index: Int
    
    var isSelected = false {
        didSet {
            animateItems()
        }
    }
    
    private let item: TabItem
    
    init(with item: TabItem, index: Int, label: String) {
        
        self.item = item
        self.index = index
        super.init(frame: .zero)
        self.labelView.text = label
        self.labelView.textColor = .white

//        self.labelView.textAlignment = .justified
//        self.labelView.sizeToFit()
//        self.labelView.backgroundColor = .green
//        backgroundColor = .systemBlue
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(contentView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(labelView)
        iconImageView.image = isSelected ? item.selectedIcon : item.icon

        contentView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
//            make.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.bottom.top.leading.equalTo(contentView)
        }
        
        if labelView.text != "" {
            labelView.snp.makeConstraints { make in
                make.leading.equalTo(iconImageView.snp.trailing).inset(-8)
                make.top.bottom.equalTo(iconImageView)
                make.trailing.equalTo(contentView)
            }
        }
    }
    
    private func animateItems() {
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}
