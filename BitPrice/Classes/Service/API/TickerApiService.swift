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
    
    func get(success: @escaping (Data) -> Void,
             failure: @escaping (Error?) -> Void) {
        
        _ = self.sessionManager.request(TickerApiRouter.get())
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    failure(nil)
                    return
                }
                
                if let error = response.error {
                    failure(error)
                    return
                }
                
                success(data)
        }
    }
    
}
