//
//  TickerApiService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class TickerApiService: ApiService {
    
    // MARK: - Variable
    
    weak var delegate: TickerApiServiceDelegate?
    
    // MARK: - Public
    
    func get() {
        _ = self.sessionManager.request(TickerApiRouter.get())
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    self.delegate?.tickerApiGetDidComplete(error: nil)
                    return
                }
                
                if let error = response.error {
                    self.delegate?.tickerApiGetDidComplete(error: error)
                    return
                }
                
                do {
                    let ticker = try JSONDecoder().decode(Ticker.self, from: data)
                    self.delegate?.tickerApiGetDidComplete(ticker: ticker)
                } catch let error {
                    self.delegate?.tickerApiGetDidComplete(error: error)
                }
        }
    }
    
}

protocol TickerApiServiceDelegate: class {
    func tickerApiGetDidComplete(ticker: Ticker)
    func tickerApiGetDidComplete(error: Error?)
}
