//
//  File.swift
//  
//
//  Created by Edu on 18/09/22.
//

import Foundation
import Alamofire
import PromiseKit

// MARK: - Check Connectivity Class -
fileprivate class FConnectivity {
    class var isConnedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

// MARK: - Main API Build Request -
class APIRequest: NSObject {

    // MARK: - Shared Ins
    static let shared = APIRequest()

    // MARK: - MAIN AF REQUEST
    func makeRequest<T: Codable>(resource: APIResource,
                                 type: T.Type,
                                 params: Parameters? = nil,
                                 headers: HTTPHeaders? = nil) -> Promise<T> {

        guard FConnectivity.isConnedToInternet else { return defaultPromiseError() }
        guard let baseURL = resource.baseURL else { return defaultPromiseError() }
        guard let request = self.buildRequest(resource: resource,
                                              baseURL: baseURL,
                                              params: params,
                                              headers: headers) else {
            return defaultPromiseError()
        }

        var mainRequest: DataRequest?
        mainRequest = AF.request(request)
        printLog("MAIN API URL: ", request.url ?? "")
        printLog("MAIN API HEADERS: ", request.headers)
        printLog("MAIN API PARAMETERS: ", params ?? "")

        return Promise { seal in
            mainRequest?
                .validate()
                .responseDecodable(of: type, queue: DispatchQueue.global(qos: .userInitiated)) { response in

                    self.printLog("MAIN API RESPONSE: ", response)
                    switch response.result {
                    case .success(let data):
                        if let statusCode = response.response?.statusCode {
                            if 200...206 ~= statusCode {
                                guard let dicResponse = data.asDic else { return }
                                guard let dataResponse = self.makeDataFrom(dic: dicResponse) else { return }
                                if let dataResult = self.makeDecode(type, dataResponse) {
                                    return seal.fulfill(dataResult)
                                }
                            }

                        }
                        return seal.reject(RequestError.APIError("NotHaveInternetMSGKey".localized()))
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }

    private func buildRequest(resource: APIResource,
                              baseURL: URL,
                              params: Parameters?,
                              headers: HTTPHeaders?) -> URLRequest? {

        var request: URLRequest?
        switch resource.paramsType {
        case .query:

            var urlComponents = URLComponents(string: baseURL.absoluteString)
            urlComponents?.queryItems = params?.map {
                URLQueryItem(name: $0, value: String(describing: $1))
            }

            if let url = urlComponents?.url {
                request = URLRequest(url: url)
            }

        case .url:

            var urlStr = baseURL.absoluteString
            params?.values.forEach({ param in
                urlStr += "/\(param)"
            })

            if let url = URL.init(string: urlStr) {
                request = URLRequest.init(url: url)
            }

        case .body:
            request = URLRequest(url: baseURL)
            request?.httpBody = self.serialize(params: params)
        }
        request?.httpMethod = resource.method.rawValue
        request?.headers = headers ?? []

        return request
    }
}
