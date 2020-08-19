//
//  Craving.swift
//  exsmoker
//
//  Created by vaux on 18.08.20.
//  Copyright © 2020 exsmoker. All rights reserved.
//

import SwiftUI

struct Craving: View {
    @State private var reason = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    Text("You would break a streak of")
                        .font(.footnote)
                ) {
                    Text("12rs 25minutes")
                        .font(.title)
                }
                Section(header:
                    Text("What triggered it?")) {
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I saw somebody smoking")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I'm bored")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I'm anxious'")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I'm nervous")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I just feel like it")
                            .padding()
                            .foregroundColor(.pink)
                    }
                    Button(action: {
                        self.reason = true
                    }) {
                        Text("I don't know")
                            .padding()
                            .foregroundColor(.pink)
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("Craving", displayMode: .large)
                .sheet(isPresented: $reason) {
                    Reasons()
                }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
