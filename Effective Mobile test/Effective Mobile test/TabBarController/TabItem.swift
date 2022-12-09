//
//  TabItem.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case explorer
    case checkout
    case favorites
    case profile
    
}

extension TabItem {
    
    var viewController: UIViewController {
        switch self {
        case .explorer:
            let nc = UINavigationController(rootViewController: ExplorerViewController())
            return nc
        case .checkout:
            let nc = UINavigationController(rootViewController: CardViewController())
            return nc
        case .favorites:
            let nc = UINavigationController(rootViewController: ViewController())
            return nc
        case .profile:
            let nc = UINavigationController(rootViewController: ViewController())
            return nc
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .explorer:
            return UIImage(named: "explorer")?.withTintColor(.white.withAlphaComponent(0.4))
        case .checkout:
            return UIImage(named: "checkout")?.withTintColor(.white.withAlphaComponent(0.4))
        case .favorites:
            return UIImage(named: "favorites")?.withTintColor(.white.withAlphaComponent(0.4))
        case .profile:
            return UIImage(named: "profile")?.withTintColor(.white.withAlphaComponent(0.4))
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .explorer:
            return UIImage(named: "explorer")?.withTintColor(.white)
        case .checkout:
            return UIImage(named: "checkout")?.withTintColor(.white)
        case .favorites:
            return UIImage(named: "favorites")?.withTintColor(.white)
        case .profile:
            return UIImage(named: "profile")?.withTintColor(.white)
        }
    }
    
    var name: String {
        return self.rawValue
    }
}
