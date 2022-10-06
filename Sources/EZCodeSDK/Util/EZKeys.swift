//
//  File.swift
//  
//
//  Created by Edu on 20/08/22.
//

import Foundation

struct EZKeys {

    // MARK: - Standar App Keys
    static let USER_FB_FAV_PATH_KEY             = "/Favorites/"
    static let USER_DATA_KEY                    = "USER_DATA_KEY"
    static let USER_NOTI_COUNT_KEY              = "USER_NOTI_COUNT_KEY"
    static let LOADING_VIEW_TAG                 = 1001
    static let TABLE_VIEW_BG_IMG_TAG            = 2001
    static let VC_PRESENT_WITH_NAV_TYPE_TAG     = 3001
    static let VC_PRESENT_NORMAL_TYPE_TAG       = 3002


    // MARK: - Regex Keys
    static let emailRegex  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let passRegex   = "^.{6,}$"
    static let cpfRegex    = "^.{14,14}$"
    static let cepRegex    = "^.{9,9}$"
    static let phoneRegex  = "^.{9,14}$"
    static let cvcRegex    = "^.{3,4}$"
    static let cardRegex   = "^.{14,17}$"
}

