//
//  TabBar.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import SnapKit

final class TabBar: UIView {
    
    let stack = UIStackView()
    
    var itemTapped: Observable<Int> { itemTappedSubject.asObservable() }
    
    private lazy var customItemViews: [TabItemView] = [explorerItem, checkoutItem, favoritesItem, profileItem]
    
    private let explorerItem = TabItemView(with: .explorer, index: 0, label: "Explorer", badge: "")
    let checkoutItem = TabItemView(with: .cart, index: 1, label: "", badge: "")
    private let favoritesItem = TabItemView(with: .favorites, index: 2, label: "", badge: "")
    private let profileItem = TabItemView(with: .profile, index: 3, label: "", badge: "")
  
    private let itemTappedSubject = PublishSubject<Int>()
    
    private let disposeBag = DisposeBag()
    
    var selectedItemIndex: Int?
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupProperties()
        setupLayout()
        bind()
        
        setNeedsLayout()
        layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(stack)
        
        stack.addArrangedSubviews([explorerItem, checkoutItem, favoritesItem, profileItem])
    }
    
    private func setupLayout() {
        
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview()
        }
 
    }
    
    private func setupProperties() {
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.alignment = .center
        
        backgroundColor = .appTestDarckColor
        setupCornerRadius(32)

        customItemViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
        }
    }
    
    private func selectItem(index: Int) {
        customItemViews.forEach { $0.isSelected = $0.index == index }
        itemTappedSubject.onNext(index)
        selectedItemIndex = index
    }
    
    //MARK: - Bindings
    
    private func bind() {
        explorerItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.explorerItem.animateClick {
                    self.selectItem(index: self.explorerItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        checkoutItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.checkoutItem.animateClick {
                    self.selectItem(index: self.checkoutItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        favoritesItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.favoritesItem.animateClick {
                    self.selectItem(index: self.favoritesItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        profileItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.profileItem.animateClick {
                    self.selectItem(index: self.profileItem.index)
                }
            }
            .disposed(by: disposeBag)
    }
}
