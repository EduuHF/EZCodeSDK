//
//  File.swift
//  
//
//  Created by Edu on 18/09/22.
//

import Foundation

protocol APIProtocol {
    func onError(msg: String?)
    func onFailure(msg: String?)
}

protocol EndpointType {
    var baseURL: URL? { get }
    var wsPath: String { get }
}

