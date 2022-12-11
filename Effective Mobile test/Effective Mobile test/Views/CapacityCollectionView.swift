//
//  CapacityCollectionView.swift
//
//  ColorCollectionView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit

class CapacityCollectionView: UICollectionView{
    
    var capacity: [String]? {
        didSet {
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

extension CapacityCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        capacity?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifire, for: indexPath) as! UICollectionViewCell
        
        cell.setupCornerRadius(15)
        if let capacity = capacity?[indexPath.row] {
            
            let label: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.text = "\(capacity) GB"
                label.adjustsFontSizeToFitWidth = true
                label.minimumScaleFactor = 0.5
                label.numberOfLines = 1
                label.font = UIFont(name: "MarkPro", size: 13)
                label.textColor = .white
                return label
            }()
            
            cell.contentView.addSubviews(label)

            label.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            if indexPath.row%2 == 0 {
                cell.backgroundColor = .appTestColor
                label.textColor = .white
            } else {
                cell.backgroundColor = .white
                label.textColor = .gray
            }
        }
        
        
        return cell
    }
}

extension CapacityCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = 16
        let width = Int(self.bounds.height * 1.4)
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
