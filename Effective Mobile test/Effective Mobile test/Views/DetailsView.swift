//
//  DetailsView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit
import SnapKit

class DetailsView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Some text"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.font = UIFont(name: "MarkPro", size: 26)
        label.textColor = .black
        return label
    }()
    
    let likeButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "detailLike")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(title)
        self.addSubviews(likeButton)
        
        title.snp.makeConstraints { make in
            make.top.equalTo(self).inset(28)
            make.leading.equalTo(self).inset(38)
            make.height.equalTo(30)
            make.trailing.equalTo(likeButton.snp.leading)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(self).inset(28)
            make.trailing.equalTo(self).inset(37)
            make.height.width.equalTo(37)
        }

    }

    private func setupProperties() {
        
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.setupCornerRadius(32)
        
    }
    
}
