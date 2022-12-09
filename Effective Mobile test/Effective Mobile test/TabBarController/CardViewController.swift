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
    
    let cardColletionView = CardCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(cardColletionView)
        
        cardColletionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func requestData() {
        self.networkDataFetcher.fetchDataWelcome(completion: { [weak self] result in
            if let data = result {
                print(data)
            }
        })

    }
}
