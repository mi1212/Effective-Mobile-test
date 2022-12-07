//
//  UIFont+Extention.swift
//  Any_competition
//
//  Created by Mikhail Chuparnov on 27.09.2022.
//

import UIKit

extension UIFont {
    
    static var labelFont: UIFont {
        let font = UIFont(name: "MarkPro", size: 32)
        return font!
    }
    
    func printAllFontsFamilyName() {
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
}
