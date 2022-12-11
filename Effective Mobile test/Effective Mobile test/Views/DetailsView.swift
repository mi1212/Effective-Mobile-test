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
    
    let raitingStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        return stack
    }()
    
    let propertsStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        return stack
    }()
    
    let detailStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        return stack
    }()
    
    let colorLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    let capacityLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var colorCollectionView = ColorCollectionView(frame: .zero, collectionViewLayout: self.colorLayout)
    
    lazy var capacityCollectionView = CapacityCollectionView(frame: .zero, collectionViewLayout: self.capacityLayout)
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart    ", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        button.backgroundColor = .appTestColor
        button.setupCornerRadius(10)
        return button
    }()
    
    let colorAndCapacityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Select color and capacity"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.font = UIFont(name: "MarkPro", size: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProperties()
        configuretionRaitingStack()
        configuretionPropertsStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(title)
        self.addSubview(likeButton)
        self.addSubview(raitingStack)
        self.addSubview(propertsStack)
        self.addSubview(detailStack)
        self.addSubview(colorAndCapacityLabel)
        self.addSubview(colorCollectionView)
        self.addSubview(capacityCollectionView)
        self.addSubview(addToCartButton)
        
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
        
        raitingStack.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-7)
            make.leading.equalTo(title)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(14)
        }

        propertsStack.snp.makeConstraints { make in
            make.top.equalTo(raitingStack.snp.bottom).inset(-32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        detailStack.snp.makeConstraints { make in
            make.top.equalTo(propertsStack.snp.bottom).inset(-32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        
        colorAndCapacityLabel.snp.makeConstraints { make in
            make.top.equalTo(detailStack.snp.bottom).inset(-24)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        colorCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.top.equalTo(colorAndCapacityLabel.snp.bottom).inset(-16)
        }
        
        capacityCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
            make.top.equalTo(colorAndCapacityLabel.snp.bottom).inset(-16)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(capacityCollectionView.snp.bottom).inset(24)
            make.bottom.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview().inset(44)
            make.height.equalTo(54)
        }
    }

    private func setupProperties() {
        
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.setupCornerRadius(32)
        
    }
    
    private func configuretionRaitingStack() {
        for i in 0...4 {
            let star = StarRaiting()
            raitingStack.addArrangedSubview(star)
        }
    }
    
    private func configuretionPropertsStack() {
        let labels = DetailLabels.allCases.map { $0.label }
        labels.map { label in
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont(name: "MarkPro", size: 20)
        }
        propertsStack.addArrangedSubviews(labels)
        
    }
    
    func configuretionDetailStack(details: ProductDetails) {
        let cpuItem = DetailPropertsItem(with: .cpu, details: details.cpu)
        let cameraItem = DetailPropertsItem(with: .camera, details: details.camera)
        let sdItem = DetailPropertsItem(with: .sd, details: details.sd)
        let ssdItem = DetailPropertsItem(with: .ssd, details: details.ssd)
        addToCartButton.setTitle("Add to Cart      $\(details.price)", for: .normal)
        self.colorCollectionView.colors = details.color
        self.capacityCollectionView.capacity = details.capacity
        detailStack.addArrangedSubviews([cpuItem, cameraItem, sdItem, ssdItem])
        
    }
    
}
