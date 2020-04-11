//
//  SliderOptions.swift
//  SnowSeeker
//
//  Created by Dmitry Reshetnik on 11.04.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

class SliderOptions: ObservableObject {
    static let sort = ["Default", "Alphabetic", "Country"]
    static let filterSize = ["Small", "Average", "Large"]
    static let filterPrice = ["$", "$$", "$$$"]
    
    var sortSelectedIndex = 0
    var filterSizeSelectedIndex = 0
    var filterPriceSelectedIndex = 0
    var filterValue: String?
    
    var filtered: [Resort] = Bundle.main.decode("resorts.json")
}
