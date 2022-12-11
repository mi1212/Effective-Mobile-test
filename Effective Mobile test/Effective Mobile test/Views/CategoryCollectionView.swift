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
    
    var categories = [Category]()

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
        setupCategories()
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
    
    private func setupCategories() {
        let categoriesArray = CategoryItem.allCases
        
        for i in 0...categoriesArray.count - 1 {
            let category = Category(title: categoriesArray[i].rawValue, pic: categoriesArray[i].picture!, isChoused: false)
            categories.append(category)
        }
    }
    
}

extension CategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifire, for: indexPath) as! CategoryCollectionViewCell
        
        if categories[indexPath.row].isChoused {
            cell.backgroundColor = .appTestColor
            cell.picture.tintColor = .white
        } else {
            cell.backgroundColor = .white
            cell.picture.tintColor = .systemGray
        }
        
        cell.picture.image = categories[indexPath.row].pic
        cell.layer.cornerRadius = cell.bounds.width/2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .autoreverse) {
            cell?.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        } completion: { [self] _ in
            cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            if categories[indexPath.row].isChoused {
                categories[indexPath.row].isChoused.toggle()
            } else {
                for index in categories.indices {
                    categories[index].isChoused = false
                }
                categories[indexPath.row].isChoused.toggle()
                
            }
            collectionView.reloadData()
        }
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
