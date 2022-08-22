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
    static let email  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let pass   = "^.{6,}$"
    static let cpf    = "^.{14,14}$"
    static let cep    = "^.{9,9}$"
    static let phone  = "^.{9,14}$"
    static let cvc    = "^.{3,4}$"
    static let card   = "^.{14,17}$"
}

