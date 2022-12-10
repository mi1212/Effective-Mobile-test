//
//  ProductDetailsViewController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit
import SnapKit

class ProductDetailsViewController: UIViewController {

    var networkDataFetcher = NetworkDataFetcher()
    
    private var productDetails: ProductDetails? {
        didSet {
            
            setupData()
        }
    }
    
    private let picturesCollectionView = PicturesCollectionView()
    
    private let detailsView = DetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
        requestData()
        setupViews()
        setupProperties()
    }
    
    private func setupViews() {
        self.view.addSubview(picturesCollectionView)
        self.view.addSubviews(detailsView)
        
        picturesCollectionView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(picturesCollectionView.snp.width).multipliedBy(0.8)
        }
        
        detailsView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(picturesCollectionView.snp.bottom).inset(-16)
        }
    }
    
    private func setupProperties() {
        
    }
    
    private func requestData() {
        self.networkDataFetcher.fetchDataProductDetails { [self] result in
            productDetails = result
        }
    }
    
    private func setupData() {
        picturesCollectionView.productDetails = self.productDetails
        detailsView.title.text = productDetails?.title
    }

}
