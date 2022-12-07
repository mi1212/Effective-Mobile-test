//
//  BestSellerCollectionView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import UIKit
import SnapKit

class BestSellerCollectionView: UIView {
    
    var bestSeller : [BestSeller]? {
        didSet {
            bestSellerCollectionView.reloadData()
        }
    }
    
    private let labelView = UILabel()
    
    private let viewAllButton = UIButton()
    
    lazy var bestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: BestSellerCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperts()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(bestSellerCollectionView)
        self.addSubview(labelView)
        self.addSubview(viewAllButton)
        let inset = 16
        
        labelView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(inset)
        }
        
        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(inset)
            make.centerY.equalTo(labelView)
        }
        
        bestSellerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview().inset(inset)
        }
    }
    private func setupProperts() {
        labelView.text = "Best Seller"
        labelView.font = .labelFont
        viewAllButton.setTitle("see more", for: .normal)
        viewAllButton.setTitleColor(.appTestColor, for: .normal)
    }
    
}

extension BestSellerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bestSeller?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.identifire, for: indexPath) as! BestSellerCollectionViewCell
        
        if let bestSeller = bestSeller?[indexPath.row] {
            cell.bestSeller = bestSeller
        }
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 12
        return cell
    }
 
}

extension BestSellerCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = 16
        let labelInset = labelView.frame.height
        let width = (Int(self.bounds.width) - inset*3)/2
        let height = (Int(self.bounds.height) - inset*3 - Int(labelInset))/2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

}
