//
//  NavigationBarView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 11.12.2022.
//

import UIKit
import SnapKit

class NavigationBarView: UIView {
    
    let label = CommonSmallLabel(title: "")
    
    let locationImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "location")
        return image
    }()
    
    let arrow: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "arrowDown")
        picture.contentMode = .scaleAspectFit
        return picture
    }()
    
    convenience init(_ title: String) {
        self.init()
        setupProperties()
        setupView()
        label.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(label)
        self.addSubview(locationImage)
        self.addSubview(arrow)
        
        locationImage.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(11)
            make.width.equalTo(locationImage.snp.height)
        }
        
        arrow.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(-11)
            make.width.equalTo(locationImage.snp.height)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(locationImage.snp.trailing).inset(11)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(arrow.snp.leading).inset(11)
        }
    }
    
    private func setupProperties() {
        label.textAlignment = .center
    }
    
}
