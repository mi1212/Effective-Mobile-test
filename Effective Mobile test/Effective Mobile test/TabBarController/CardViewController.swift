//
//  CardViewController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 09.12.2022.
//

import UIKit
import SnapKit

class CardViewController: UIViewController {

    var networkDataFetcher = NetworkDataFetcher()
    
    var card: Card? {
        didSet {
            cardCollectionView.card = self.card
        }
    }

    private let labelView = UILabel()
        
    let cardCollectionView = CardCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupViews()
        setupProperts()
    }
    
    private func setupViews() {
        
        self.view.addSubview(labelView)
        self.view.addSubview(cardCollectionView)

        let inset = 16
        
        labelView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            make.leading.equalToSuperview().inset(42)
            make.height.equalTo(30)
        }
        
        cardCollectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(labelView.snp.bottom).inset(-49)
        }

    }
    
    private func setupProperts() {
        labelView.text = "My Card"
        labelView.font = .labelFont
//        viewAllButton.setTitle("see more", for: .normal)
//        viewAllButton.setTitleColor(.appTestColor, for: .normal)
    }

    private func requestData() {
        self.networkDataFetcher.fetchDataCard(completion: { [weak self] result in
            if let data = result {
                self?.card = data
            }
        })

    }
}
