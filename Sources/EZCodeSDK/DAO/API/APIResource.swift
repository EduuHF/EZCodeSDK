//
//  File.swift
//  
//
//  Created by Edu on 18/09/22.
//

import Foundation
import Alamofire

public enum APIParamsType {
    case body
    case url
    case query
}

public enum APIResource {
    case base
}

extension APIResource: EndpointType {

    public var baseURL: URL? {
        let infoDic = Bundle.main.infoDictionary
        var baseURL = infoDic?["SERVER_URL"] as? String
        #if DEBUG
        baseURL = infoDic?["SERVER_URL_DEV"] as? String
        #endif
        return URL(string: baseURL ?? "")
    }

    public var wsPath: String {
        // Default Value
        return ""
    }

    public var method: HTTPMethod {
        // Default Value
        return .get
    }

    public var paramsType: APIParamsType {
        // Default Value
        return .url
    }
}

public enum RequestError: Error {
    case APIError(String)
    case UNError
}

extension RequestError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .APIError(let error):
            return error
        case .UNError:
            return "StandarAPIErrorMSGKey".localized()
        }
    }
}
