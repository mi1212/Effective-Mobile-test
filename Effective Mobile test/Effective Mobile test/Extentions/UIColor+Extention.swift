//
//  UIColor+Extention.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 06.12.2022.
//

import UIKit

extension UIColor {
    
    static var backgroundColor: UIColor? {
        #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
    }
    
    static var appTestColor: UIColor{
        #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    }
    
    static var anyPurpleColor: UIColor{
        #colorLiteral(red: 0.8862745098, green: 0.8274509804, blue: 1, alpha: 1)
    }
    
    static var appTestDarckColor: UIColor{
        #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255
                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }

        return nil
    }
}
