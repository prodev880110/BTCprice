//
//  TickerApiRouter.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Alamofire
import Foundation

enum TickerApiRouter: URLRequestConvertible {

    // MARK: - Router

    case get()

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: ApiService.Params.baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .get: urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }

        return urlRequest
    }

    // MARK: - Private

    private var method: HTTPMethod {
        switch self {
        case .get: return .get
        }
    }

    private var path: String {
        switch self {
        case .get: return "/ticker"
        }
    }

}
