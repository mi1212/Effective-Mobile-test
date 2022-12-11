//
//  ColorCollectionView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit

class ColorCollectionView: UICollectionView{

    var colors: [String]? {
        didSet {
            print(self.colors)
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifire)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifire, for: indexPath) as! UICollectionViewCell
        if let color = colors?[indexPath.row] {
            cell.backgroundColor = UIColor(hex: color)
        }
        cell.setupCornerRadius(20)
        return cell
    }
}

extension ColorCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = 16
        let width = Int(self.bounds.height)
        let height = Int(self.bounds.height)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect in colorCollectionView")
    }
}
