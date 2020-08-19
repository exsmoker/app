//
//  Reasons.swift
//  exsmoker
//
//  Created by vaux on 19.08.20.
//  Copyright © 2020 exsmoker. All rights reserved.
//

import SwiftUI

struct Reasons: View {
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    VStack {
                        Text("Reasons to resist")
                            .font(.footnote)
                        Button(action: {
                            
                        }) {
                            Text("Any reason")
                                .font(.headline)
                                .foregroundColor(.pink)
                                .padding()
                        }.accentColor(.clear)
                }) {
                    Item(title: "", image: "")
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("Craving", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct Item: View {
    let title: String
    let image: String
    
    var body: some View {
        Image(image)
    }
}
