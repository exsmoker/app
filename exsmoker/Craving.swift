//
//  Craving.swift
//  exsmoker
//
//  Created by vaux on 18.08.20.
//  Copyright © 2020 exsmoker. All rights reserved.
//

import SwiftUI

struct Craving: View {
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    Text("What triggered it?")) {
                    Button(action: {
                        
                    }) {
                        Text("I saw somebody smoking")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        
                    }) {
                        Text("I'm bored")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        
                    }) {
                        Text("I'm anxious'")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        
                    }) {
                        Text("I'm nervous")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        
                    }) {
                        Text("I just feel like it")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        
                    }) {
                        Text("I don't know")
                            .padding()
                            .foregroundColor(.pink)
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("Craving", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
