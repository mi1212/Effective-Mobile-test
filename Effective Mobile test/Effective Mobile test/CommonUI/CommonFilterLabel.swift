//
//  CommonFilterLabel.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 11.12.2022.
//

import UIKit
import SnapKit

class CommonFilterLabel: UILabel {

    let topInset: CGFloat = 7.0
    let bottomInset: CGFloat = 7.0
    let leftInset: CGFloat = 14.0
    let rightInset: CGFloat = 14.0
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "arrowDown")
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        self.text = title
        configure()
        setupPicture()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func drawText(in rect: CGRect) {
            let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            super.drawText(in: rect.inset(by: insets))
        }

        override var intrinsicContentSize: CGSize {
            let size = super.intrinsicContentSize
            return CGSize(width: size.width + leftInset + rightInset,
                          height: size.height + topInset + bottomInset)
        }
    
    private func configure() {
        self.font = .labelFontSmall
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 1
        self.textAlignment = .left
        self.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1).cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    private func setupPicture() {
        self.addSubview(picture)
        
        picture.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(picture.snp.height)
            
        }
    }
}
