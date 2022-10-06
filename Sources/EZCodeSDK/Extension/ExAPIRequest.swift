//
//  File.swift
//  
//
//  Created by Edu on 18/09/22.
//

import Foundation
import Alamofire
import PromiseKit

// MARK: Extension Methods
extension APIRequest {

    // MARK: Private Methods for Decoder Data
    public func makeDataFrom(dic: [String: Any]) -> Data? {
        do {
            return try? JSONSerialization.data(withJSONObject: dic,
                                               options: .prettyPrinted)
        }
    }

    public func makeDecode<T: Codable>(_ type: T.Type,
                                       _ data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(type,
                                          from: data)
        } catch {
            return makeDecodeWithFragments(data)
        }
    }

    public func makeDecodeWithFragments<T: Codable>(_ data: Data) -> T? {
        do {
            return try JSONSerialization.jsonObject(with: data,
                                                    options: .allowFragments) as? T
        } catch {
            return nil
        }
    }

    public func serialize(params: Parameters?) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: params ?? [],
                                              options: JSONSerialization
                .WritingOptions(rawValue: 0))
        } catch {
            return nil
        }
    }

    public func defaultPromiseError<T: Codable>() -> Promise<T> {
        return Promise { seal in seal.reject(
            RequestError
                .APIError("NotHaveInternetMSGKey".localized()))}
    }
}
