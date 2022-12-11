//
//  CommonCollorButton.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 11.12.2022.
//

import UIKit

class CommonCollorButton: UIButton {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.clipsToBounds = true
        self.backgroundColor = .appTestColor
        self.titleLabel?.font = UIFont(name: "MarkPro", size: 18)
        self.setupCornerRadius(10)
        self.setTitleColor(.white, for: .normal)
    }
}
