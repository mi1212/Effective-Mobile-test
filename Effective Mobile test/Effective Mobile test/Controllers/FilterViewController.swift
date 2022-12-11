//
//  FilterViewController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 08.12.2022.
//

import UIKit
import SnapKit

class FilterViewController: UIViewController {

    private let labelView = CommonSmallLabel(title: "Filter options")
    
    private let brandLabel = CommonSmallLabel(title: "Brand")
    
    private let brandFilterLabel = CommonFilterLabel(title: "Samsung")
    
    private let priceLabel = CommonSmallLabel(title: "Price")
    
    private let priceFilterLabel = CommonFilterLabel(title: "$300 - $500")
    
    private let sizeLabel = CommonSmallLabel(title: "Size")
    
    private let sizeFilterLabel = CommonFilterLabel(title: "4.5 to 5.5 inches")
    
    private let doneButton = CommonCollorButton(title: "Done")
    
    private let closeButton = CommonCloseButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupProperts()
        
    }
    
    private func setupViews() {
        
        self.view.addSubview(labelView)
        self.view.addSubview(brandLabel)
        self.view.addSubview(brandFilterLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(priceFilterLabel)
        self.view.addSubview(sizeLabel)
        self.view.addSubview(sizeFilterLabel)
        self.view.addSubview(doneButton)
        self.view.addSubview(closeButton)

        labelView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(31)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.bottom).inset(-31)
            make.leading.equalToSuperview().inset(46)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(20)
        }
        
        brandFilterLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).inset(-8)
            make.leading.equalTo(brandLabel)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(37)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(brandFilterLabel.snp.bottom).inset(-16)
            make.leading.equalToSuperview().inset(46)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(20)
        }
        
        priceFilterLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).inset(-8)
            make.leading.equalTo(brandLabel)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(37)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.top.equalTo(priceFilterLabel.snp.bottom).inset(-16)
            make.leading.equalToSuperview().inset(46)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(20)
        }
        
        sizeFilterLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).inset(-8)
            make.leading.equalTo(brandLabel)
            make.trailing.equalToSuperview().inset(31)
            make.height.equalTo(37)
        }
        
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(37)
            make.top.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(27)
            make.leading.equalTo(labelView.snp.trailing).inset(-44)
        }
        
        closeButton.snp.makeConstraints { make in
            make.height.width.equalTo(37)
            make.top.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(27)
        }
        
    }
    
    private func setupProperts() {
        self.view.backgroundColor = .backgroundColor
        
        labelView.text = "Filter options"
        labelView.font = .labelFontSmall
        
        doneButton.addTarget(self, action: #selector(tapDoneButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
    }
    
    @objc func tapDoneButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
