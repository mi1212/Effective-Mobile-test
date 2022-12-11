//
//  StarRaiting.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import Foundation

import UIKit
import SnapKit

class StarRaiting: UIView {
    
    let star: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "star")
        image.contentMode = .scaleAspectFit
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
        self.addSubview(star)
        
        star.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }

    private func setupProperties() {

        
    }
    
}
