//
//  ExNSObject.swift
//  
//
//  Created by Edu on 18/09/22.
//

import UIKit

extension NSObject {

    public func printLog(_ items: Any...,
                         separator: String = " ",
                         terminator: String = "\n") {

        #if DEBUG
            print(items, separator, terminator)
        #endif

    }
}
