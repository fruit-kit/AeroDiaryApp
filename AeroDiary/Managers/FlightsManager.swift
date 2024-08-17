//
//  FlightsManager.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 10.08.2024.
//

import Foundation

class FlightsManager {
    
    static let shared = FlightsManager()
    
    private init() {
        
        loadFlights()
        
    }
    
    var flights: [Flight] = [] {
        
        didSet {
            
            saveFlights()
            
        }
        
    }
    
    struct Flight: Codable {
        
        let flightNumber: String
        
        let route: String
        
        let dateTime: String
        
        let note: String
        
    }
    
    private func saveFlights() {
        
            if let encodedData = try? JSONEncoder().encode(flights) {
                UserDefaults.standard.set(encodedData, forKey: "savedFlights")
                
            }
        
        }
    
    private func loadFlights() {
        
            if let savedData = UserDefaults.standard.data(forKey: "savedFlights"),
               let decodedFlights = try? JSONDecoder().decode([Flight].self, from: savedData) {
                flights = decodedFlights
                
            }
        
        }
    
}
