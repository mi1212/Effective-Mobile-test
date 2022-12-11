//
//  DetailProperts.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 10.12.2022.
//

import UIKit

enum DetailProperts: String, CaseIterable  {
    case cpu
    case camera
    case ssd
    case sd
}

extension DetailProperts {
    
    var image: UIImage {
        switch self {
        case .cpu:
            let image = UIImage(named: "cpu")
            return image ?? UIImage()
        case .camera:
            let image = UIImage(named: "camera")
            return image ?? UIImage()
        case .ssd:
            let image = UIImage(named: "ssd")
            return image ?? UIImage()
        case .sd:
            let image = UIImage(named: "sd")
            return image ?? UIImage()
        }
    }
    
    var title: String {
        switch self {

        case .cpu:
            let title = "cpu"
            return title
        case .camera:
            let title = "camera"
            return title
        case .ssd:
            let title = "ssd"
            return title
        case .sd:
            let title = "sd"
            return title
        }
    }

}
