//
//  CommonSmallLabel.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 11.12.2022.
//

import UIKit
import SnapKit

class CommonSmallLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        self.text = title
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func configure() {
        self.font = .labelFontSmall
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 1
        self.textAlignment = .left
    }
}
