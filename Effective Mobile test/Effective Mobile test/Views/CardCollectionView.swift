//
//  CardCollectionView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 09.12.2022.
//

import UIKit
import SnapKit

class CardCollectionView: UIView {
    
    var card : Card? {
        didSet {
            setupData()
            cardCollectionView.reloadData()
        }
    }
    
    lazy var cardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(CardItemCollectionViewCell.self, forCellWithReuseIdentifier: CardItemCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let totalStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.251888452).cgColor
        stack.layer.borderWidth = 2
        return stack
    }()
    
    let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()
    
    let priceStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery"
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryPriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkoutButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        labelStack.addArrangedSubview(totalLabel)
        labelStack.addArrangedSubview(deliveryLabel)
        priceStack.addArrangedSubview(priceLabel)
        priceStack.addArrangedSubview(deliveryPriceLabel)
        
        totalStack.addArrangedSubview(labelStack)
        totalStack.addArrangedSubview(priceStack)
        self.addSubview(totalStack)
        self.addSubview(cardCollectionView)
        self.addSubview(checkoutButton)
    
        checkoutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(44)
            make.height.equalTo(54)
        }
        
        
        totalStack.snp.makeConstraints { make in
            make.bottom.equalTo(checkoutButton.snp.top).inset(-27)
            make.leading.trailing.equalToSuperview().inset(-2)
            make.height.equalTo(91)
        }
        

        cardCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(23)
            make.bottom.equalTo(totalStack.snp.top)
        }
        
    }
    
    private func setupProperts() {
        self.backgroundColor = .appTestDarckColor
        self.setupCornerRadius(30)
        
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.backgroundColor = .appTestColor
        checkoutButton.setupCornerRadius(10)
        
        

    }
    
    private func setupData() {
        if let card = self.card {
            self.priceLabel.text = "$\(card.total)"
            self.deliveryPriceLabel.text = "\(card.delivery)"
        }
    }

    
}

extension CardCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        card?.basket.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItemCollectionViewCell.identifire, for: indexPath) as! CardItemCollectionViewCell
        if let basket = card?.basket {
            
            cell.setupData(basket: basket[indexPath.row])
            
        }

        return cell
    }
 
}

extension CardCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (Int(self.bounds.width) - 23*2)
        let height = (Int(self.bounds.height) - 45*4)/5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

}
