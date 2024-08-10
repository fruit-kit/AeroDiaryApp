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
    
    var flights: [Flight] = [
        Flight(flightName: "Vacation", route: "New York - Moscow"),
        Flight(flightName: "Business Trip", route: "Los Angeles - Tokyo"),
        Flight(flightName: "Family Visit", route: "Paris - London"),
        Flight(flightName: "Holiday", route: "Dubai - Sydney"),
        Flight(flightName: "New Flight", route: "Example Route - Destination")
    ]
    
}

struct Flight {
    
    let flightName: String
    
    let route: String
    
}
