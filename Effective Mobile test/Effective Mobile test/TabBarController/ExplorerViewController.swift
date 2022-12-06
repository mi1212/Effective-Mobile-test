//
//  ExplorerViewController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import SnapKit

class ExplorerViewController: UIViewController {

    let categoryCollectionView = CategoryCollectionView()
    
    let searchTextField = AppTextField()
    
    let qrButton = UIImageView()
    
    let hotSalesCollectionView = HotSalesCollextionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
        setup()
        setupProperties()
    }
    
    private func setup() {
        view.addSubview(categoryCollectionView)
        view.addSubview(searchTextField)
        view.addSubview(qrButton)
        view.addSubview(hotSalesCollectionView)
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        qrButton.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).inset(-32)
            make.trailing.equalToSuperview().inset(32)
            make.height.width.equalTo(34)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).inset(-32)
            make.leading.equalToSuperview().inset(37)
            make.trailing.equalTo(qrButton.snp.leading).inset(-11)
            make.height.equalTo(34)
        }
        
        hotSalesCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(searchTextField.snp.bottom).inset(-21)
            make.height.equalToSuperview().multipliedBy(0.30)
        }
        
    }
    
    private func setupProperties() {
        searchTextField.addShadow(radius: 20, opacity: 0.15)
        
//        qrButton.setupCornerRadius(17)
        qrButton.backgroundColor = .appTestColor
        qrButton.image = UIImage(named: "qr")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
