//
//  TickerService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class TickerService: Service<Ticker> {
    
    // MARK: - Variable
    
    weak var delegate: TickerServiceDelegate?
    
    private let apiService = TickerApiService()
    
    // MARK: - Public
    
    func get() {
        apiService.get(success: { (data) in
            self.success(data: data)
        }) { (error) in
            self.failure(error: error)
        }
    }
    
    // MARK: - Private
    
    private func success(data: Data) {
        if let ticker = jsonDecode(data: data) {
            let date = Date()
            delegate?.tickerGetDidComplete(ticker: ticker, date: date)
            dbInsert(data: data, date: date)
        } else {
            delegate?.tickerGetDidComplete(error: nil)
        }
    }
    
    private func failure(error: Error?) {
        guard let request = RequestDbService().fetch(reference: nil) else {
            delegate?.tickerGetDidComplete(error: error)
            return
        }
        
        if let ticker = jsonDecode(data: request.data) {
            delegate?.tickerGetDidComplete(ticker: ticker, date: request.date)
            return
        }

        delegate?.tickerGetDidComplete(error: error)
    }

}

protocol TickerServiceDelegate: class {
    func tickerGetDidComplete(ticker: Ticker, date: Date)
    func tickerGetDidComplete(error: Error?)
}
