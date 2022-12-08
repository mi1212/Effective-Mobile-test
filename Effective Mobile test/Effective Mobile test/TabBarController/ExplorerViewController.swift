//
//  ExplorerViewController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import SnapKit

class ExplorerViewController: UIViewController {
    
    var networkDataFetcher = NetworkDataFetcher()
    
    var resultData: ResultData? {
        didSet {
            hotSalesCollectionView.hotSales = self.resultData?.homeStore
            bestSellerCollectionView.bestSeller = self.resultData?.bestSeller
        }
    }
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()

    let categoryCollectionView = CategoryCollectionView()
    
    let searchTextField = AppTextField()
    
    let qrButton = UIImageView()
    
    let hotSalesCollectionView = HotSalesCollextionView()
    
    let bestSellerCollectionView = BestSellerCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
        setup()
        setupProperties()
        requestData()
        setupNavigationBar()
    }
    
    private func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(searchTextField)
        contentView.addSubview(qrButton)
        contentView.addSubview(hotSalesCollectionView)
        contentView.addSubview(bestSellerCollectionView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
            make.height.equalTo(self.view).multipliedBy(0.15)
        }
        
        qrButton.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).inset(-32)
            make.trailing.equalTo(contentView).inset(32)
            make.height.width.equalTo(34)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).inset(-32)
            make.leading.equalTo(contentView).inset(37)
            make.trailing.equalTo(qrButton.snp.leading).inset(-11)
            make.height.equalTo(34)
        }

        hotSalesCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView)
            make.top.equalTo(searchTextField.snp.bottom).inset(-21)
            make.height.equalTo(self.view).multipliedBy(0.30)
        }

        bestSellerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(hotSalesCollectionView.snp.bottom).inset(-21)
            make.leading.trailing.bottom.equalToSuperview()
            make.bottom.equalTo(contentView).inset(70)
            make.height.equalTo(self.view).multipliedBy(0.6)
        }
        
    }
    
    private func setupProperties() {
        searchTextField.addShadow(radius: 20, opacity: 0.05)
        
        qrButton.backgroundColor = .appTestColor
        qrButton.image = UIImage(named: "qr")
    }
    
    private func requestData() {
        self.networkDataFetcher.fetchData(completion: { [weak self] result in
            if let data = result {
                self?.resultData = data
            }
        })

    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .appTestDarckColor
        
        let filter = UIImage(named: "filter")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: filter,
            style: .plain,
            target: self,
            action: #selector(presentFilterViewController)
        )
    }

    @objc func presentFilterViewController() {
        let vc = FilterViewController()
        navigationController?.present(vc, animated: true)
    }
}
