//
//  DetailLabels.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit

enum DetailLabels: String, CaseIterable  {
    case shop
    case details
    case features
}

extension DetailLabels {
    
    var label: UILabel {
        switch self {
        case .shop:
            let label = UILabel()
            label.text = "Shop"
            return label
        case .details:
            let label = UILabel()
            label.text = "Details"
            return label
        case .features:
            let label = UILabel()
            label.text = "Features"
            return label
        }
    }
}
