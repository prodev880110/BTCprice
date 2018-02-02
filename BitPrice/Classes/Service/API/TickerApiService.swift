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
             failure: @escaping (ServiceFailureType) -> Void) {
        
        _ = self.sessionManager.request(TickerApiRouter.get())
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    failure(self.failure())
                    return
                }
                
                if response.error != nil {
                    failure(self.failure())
                    return
                }
                
                success(data)
        }
    }
    
}
