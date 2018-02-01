//
//  TickerApiService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class TickerApiService: ApiService {
    
    // MARK: - Public
    
    func get(success: @escaping (String?, Ticker) -> Void,
             failure: @escaping (String?, Error?) -> Void) {
        
        _ = self.sessionManager.request(TickerApiRouter.get())
            .validate(statusCode: [200])
            .responseJSON { response in
                let urlString = response.request?.url?.absoluteString
                
                guard let data = response.data else {
                    failure(urlString, nil)
                    return
                }
                
                if let error = response.error {
                    failure(urlString, error)
                    return
                }
                
                do {
                    let ticker = try JSONDecoder().decode(Ticker.self, from: data)
                    success(urlString, ticker)
                } catch let error {
                    failure(urlString, error)
                }
        }
    }
    
}
