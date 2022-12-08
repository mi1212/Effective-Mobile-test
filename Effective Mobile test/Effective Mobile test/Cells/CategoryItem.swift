//
//  CategoryItem.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 08.12.2022.
//

import UIKit

enum CategoryItem: String, CaseIterable {
    case books
    case computer
    case health
    case phones
    
}

extension CategoryItem {
    
    var picture: UIImage? {
        switch self {
        case .phones:
            return UIImage(named: "phones")
        case .computer:
            return UIImage(named: "computer")
        case .health:
            return UIImage(named: "health")
        case .books:
            return UIImage(named: "books")
        }
    }
    
    
}
