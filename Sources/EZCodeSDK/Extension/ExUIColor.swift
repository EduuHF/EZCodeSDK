//
//  ExUIColor.swift
//  BAApp
//
//  Created by Edu on 19/05/22.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: - App Colors
    public static var mainAppColor: UIColor {
        return UIColor().fromHex(0x121848)
    }

    public static var colorRed: UIColor {
        return UIColor().fromHex(0xfd4e01)
    }

    public static var colorGreen: UIColor {
        return UIColor().fromHex(0x1d7566)
    }

    public static var colorBrown: UIColor {
        return UIColor().fromHex(0x82202d)
    }

    public static var colorBlue: UIColor {
        return UIColor().fromHex(0x1c548e)
    }

    public static var colorGray: UIColor {
        return UIColor().fromHex(0x8e8c85)
    }

    public static var colorBlackAlpha: UIColor {
        return UIColor().fromHex(0x000000, alpha: 0.8)
    }

    public static var colorRandom: UIColor {

        let aColor: [UIColor] = [.colorRed,
            .colorGreen,
            .colorBrown,
            .colorBlue,
            .colorGray]

        return aColor.randomElement() ?? .white
    }

    public func colorForTheme(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        return UserDefaults
            .standard
            .string(forKey: "AppleInterfaceStyle") ==
        "Dark" ? lightColor : darkColor
    }

    public func fromHex(_ rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {

        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red: red,
                       green: green,
                       blue: blue,
                       alpha: CGFloat(alpha))
    }
}
