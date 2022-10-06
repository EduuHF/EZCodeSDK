//
//  File.swift
//  
//
//  Created by Edu on 18/09/22.
//

import Foundation
import Alamofire
import PromiseKit

public class BaseService {

    // MARK: Base Headers
    public var baseHeaders: HTTPHeaders {
        return [
            .contentType("application/json")
        ]
    }

    // MARK: Base Request
    public func excRequest<T: Codable>(promiseRequest: Promise<T>) -> Promise<T> {
        return Promise { seal in
            promiseRequest.done { response in
                seal.fulfill(response)
            }.catch { error in
                return seal.reject(error)
            }
        }
    }
}
