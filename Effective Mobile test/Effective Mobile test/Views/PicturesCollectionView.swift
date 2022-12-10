//
//  PicturesCollectionView.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit
import SnapKit

class PicturesCollectionView: UIView {
    
    var productDetails : ProductDetails? {
        didSet {
            setupData()
            pictureCollectionView.reloadData()
        }
    }
    
    
    
    lazy var pictureCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifire)
        collection.clipsToBounds = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(pictureCollectionView)
        
        pictureCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func setupProperts() {

    }
    
    private func setupData() {

    }

    private func requetsPicture(imageView: UIImageView, pictureUrl: String) {
            let url = URL(string: pictureUrl)
        imageView.sd_setImage(with: url)
    }
    
}

extension PicturesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productDetails?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifire, for: indexPath) as! UICollectionViewCell
        
        let imageView = UIImageView()
        
        if let pictureUrl = productDetails?.images[indexPath.row] {
            print(pictureUrl)
            requetsPicture(imageView: imageView, pictureUrl: pictureUrl)
            
            cell.contentView.addSubviews(imageView)
            cell.contentView.clipsToBounds = true
            cell.contentView.setupCornerRadius(24)
            cell.contentView.backgroundColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        cell.addShadow(radius: 10, opacity: 0.1)
        
        return cell
    }
 
}

extension PicturesCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (Int(self.bounds.width * 0.6))
        let height = (Int(self.bounds.height))
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

}
