//
//  ViewController.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!
    @IBOutlet private weak var footerView: FooterView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = UserDefaults.standard.reference()
        setupHeader()
        setupBody(reference: ref)
        setupFooter(reference: ref)
    }
    
    // MARK: - Private
    
    private func setupHeader() {
        headerView.delegate = self
    }
    
    private func setupBody(reference: ReferenceType) {
        let refPrice = Float(15400.32)
        let curPrice = Float(13200.56)
        bodyView.setup(reference: reference, referencePrice: refPrice, currentPrice: curPrice)
    }
    
    private func setupFooter(reference: ReferenceType) {
        footerView.delegate = self
        footerView.setReference(reference)
    }

}

