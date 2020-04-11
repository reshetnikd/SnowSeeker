//
//  SliderMenu.swift
//  SnowSeeker
//
//  Created by Dmitry Reshetnik on 11.04.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct SliderMenu: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var options: SliderOptions
    @State private var insertedText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Sort")) {
                        Picker(selection: $options.sortSelectedIndex, label: Text("Please choose a sort option")) {
                            ForEach(0 ..< SliderOptions.sort.count) { index in
                                Text(SliderOptions.sort[index]).tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Button("Sort") {
                            self.options.filtered = self.options.filtered.sorted { (lhs, rhs) -> Bool in
                                if self.options.sortSelectedIndex == 0 {
                                    return lhs.imageCredit < rhs.imageCredit
                                } else if self.options.sortSelectedIndex == 1 {
                                    return lhs.name < rhs.name
                                } else {
                                    return lhs.country < rhs.country
                                }
                            }
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    Section(header: Text("Filter")) {
                        TextField("Country", text: $insertedText)
                        
                        Picker(selection: $options.filterSizeSelectedIndex, label: Text("Please choose a size")) {
                            ForEach(0 ..< SliderOptions.filterSize.count) { index in
                                Text(SliderOptions.filterSize[index])
                            }
                        }
                        
                        Picker(selection: $options.filterPriceSelectedIndex, label: Text("Please choose a price")) {
                            ForEach(0 ..< SliderOptions.filterPrice.count) { index in
                                Text(SliderOptions.filterPrice[index])
                            }
                        }
                        
                        Button("Filter") {
                            if !self.insertedText.isEmpty {
                                self.options.filtered = self.options.filtered.filter({ $0.country.contains(self.insertedText) })
                            }
                            
                            if self.options.filterSizeSelectedIndex == 0 {
                                self.options.filtered = self.options.filtered.filter({ $0.size == 1 })
                            } else if self.options.filterSizeSelectedIndex == 1 {
                                self.options.filtered = self.options.filtered.filter({ $0.size == 2 })
                            } else {
                                self.options.filtered = self.options.filtered.filter({ $0.size == 3 })
                            }
                            
                            if self.options.filterPriceSelectedIndex == 0 {
                                self.options.filtered = self.options.filtered.filter({ $0.price == 1 })
                            } else if self.options.filterPriceSelectedIndex == 1 {
                                self.options.filtered = self.options.filtered.filter({ $0.price == 2 })
                            } else {
                                self.options.filtered = self.options.filtered.filter({ $0.price == 3 })
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                    Button("Clear") {
                        self.options.filtered = Bundle.main.decode("resorts.json")
                    }
                }
                .navigationBarTitle("Select option")
                .navigationBarItems(trailing: Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
            })
            }
        }
    }
}

struct SliderMenu_Previews: PreviewProvider {
    static var previews: some View {
        SliderMenu()
    }
}
