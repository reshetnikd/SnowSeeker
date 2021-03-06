//
//  Resort.swift
//  SnowSeeker
//
//  Created by Dmitry Reshetnik on 10.04.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
//    Alternative
//    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}
