//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Dmitry Reshetnik on 09.04.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
//    @State private var layoutVertically = false
//    @State private var selectedUser: User? = nil
//    @State private var isShowingAlert = false
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            self.layoutVertically.toggle()
//        }
//        Text("Hello, World!")
//            .onTapGesture {
//                self.selectedUser = User()
//                self.isShowingAlert = true
//            }
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text(selectedUser!.id))
//            }
//        Text("Hello, World!")
//            .onTapGesture {
//                self.selectedUser = User()
//            }
//            .alert(item: $selectedUser) { user in
//                Alert(title: Text(user.id))
//            }
//        NavigationView {
//            NavigationLink(destination: Text("New secondary")) {
//                Text("Hello, World!")
//            }
//            .navigationBarTitle("Primary")
//
//            Text("Secondary")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
