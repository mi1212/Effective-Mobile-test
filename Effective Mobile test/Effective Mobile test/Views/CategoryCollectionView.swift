//
//  CategoryCollectionView.swift
//  customTabBar
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import SnapKit

class CategoryCollectionView: UIView {
    
    private let labelView = UILabel()
    private let viewAllButton = UIButton()
    
    let categoryes = CategoryItem.allCases.map { $0.picture }

    let font = UIFont()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperts()
        setupViews()
        print("categoryes - \(categoryes)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(categoryCollectionView)
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
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(inset)
            make.bottom.equalToSuperview()
        }
    }
    private func setupProperts() {
        labelView.text = "Select Category"
        labelView.font = .labelFont
        viewAllButton.setTitle("view all", for: .normal)
        viewAllButton.setTitleColor(.appTestColor, for: .normal)
    }
    
}

extension CategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifire, for: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = .white
        cell.picture.tintColor = .appTestColor
        cell.picture.image = categoryes[indexPath.row]
        cell.layer.cornerRadius = cell.bounds.width/2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
//        collectionView.reloadData()
        
//        UIView.animate(withDuration: 1, delay: 0) {
//            cell?.transform = (cell?.transform.scaledBy(x: 0.4, y: 0.4))!
//            UIView.animate(withDuration: 1, delay: 0) {
//                cell?.backgroundColor = .appTestColor
//                cell?.picture.tintColor = .gray
//                cell?.transform = (cell?.transform.scaledBy(x: 1/0.4, y: 1/0.4))!
//            }
//        }
        
    }
 
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = 16
        let labelInset = labelView.frame.height
        let width = (Int(self.bounds.width) - inset*5)/4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

}
