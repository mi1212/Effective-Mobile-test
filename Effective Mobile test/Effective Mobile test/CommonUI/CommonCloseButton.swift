//
//  CommonCloseButton.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 11.12.2022.
//

import UIKit
import SnapKit

class CommonCloseButton: UIButton {
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "cross")
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: .zero)
        configure()
        setupPicture()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func configure() {
        self.clipsToBounds = true
        self.backgroundColor = .black
        self.setupCornerRadius(10)
    }
    
    private func setupPicture() {
        self.addSubview(picture)
        
        picture.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview().multipliedBy(0.3)
        }
    }
}
