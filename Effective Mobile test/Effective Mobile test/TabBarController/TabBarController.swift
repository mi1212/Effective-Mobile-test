//
//  TabBarController.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit
import RxSwift
import RxCocoa

class TabBarController: UITabBarController {
    
    private let customTabBar = TabBar()

    let userDefaults = UserDefaults.standard
    
    private let disposeBag = DisposeBag()
    
    init(uid: String) {
        super.init(nibName: nil, bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupProperties()
        bind()
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupHierarchy() {
        navigationController?.tabBarController?.tabBar.isHidden = true
        view.addSubview(customTabBar)
    }
    
    
    
    private func setupLayout() {
        self.view.backgroundColor = .systemTeal
        
        customTabBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
    }
    
    private func setupProperties() {
        selectedIndex = 0
        let controllers = TabItem.allCases.map { $0.viewController }
        setViewControllers(controllers, animated: true)
    }

    private func selectTabWith(index: Int) {
        self.selectedIndex = index
    }
    
    //MARK: - Bindings
    
    private func bind() {
        customTabBar.itemTapped
            .bind { [weak self] in self?.selectTabWith(index: $0)
            }
            .disposed(by: disposeBag)
    }

}
