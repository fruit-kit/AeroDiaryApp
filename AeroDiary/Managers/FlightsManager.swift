//
//  FlightsManager.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 10.08.2024.
//

import Foundation

class FlightsManager {
    
    static let shared = FlightsManager()
    
    private init() { }
    
    var flights: [Flight] = []
    
    struct Flight {
        
        let flightNumber: String
        
        let route: String
        
        let dateTime: String
        
        let note: String
        
    }
    
}
