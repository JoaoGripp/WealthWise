//
//  Stock.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import Foundation

struct Stock: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var description: String
    var price: Double
    var quantity: Double
    var porcentage: Double
}

struct MockData {
    
    static let sampleStock01 = Stock(symbol: "AAPL34",
                                     description: "Apple Company",
                                     price: 130.00,
                                     quantity: 100.00,
                                     porcentage: 0.0)
    
    static let sampleStock02 = Stock(symbol: "ITSA4",
                                     description: "Itausa Company",
                                     price: 10.00,
                                     quantity: 10.00,
                                     porcentage: 10.0)
    
    static let sampleStock03 = Stock(symbol: "IVVB11",
                                     description: "S&P500",
                                     price: 235.0,
                                     quantity: 3.0,
                                     porcentage: 10.0)
    
    static let sampleStock04 = Stock(symbol: "BCFF11",
                                     description: "Fundos Imobiliarios",
                                     price: 65.00,
                                     quantity: 8.00,
                                     porcentage: 15.0)
    
    static let sampleStocks = [sampleStock01, sampleStock02, sampleStock03, sampleStock04]
    
    
}
