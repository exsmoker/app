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
            GeometryReader { geo in
                ScrollView {
                    Text("Reasons to resist")
                        .font(.footnote)
                    Button(action: {
                        
                    }) {
                        Text("Any reason")
                            .font(.headline)
                            .foregroundColor(.pink)
                            .padding()
                    }.accentColor(.clear)
                    HStack {
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                        Item(title: "", image: "", width: geo.size.width / 2.2)
                        Spacer()
                    }
                }
            }.navigationBarTitle("Reasons", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct Item: View {
    let title: String
    let image: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: width, height: 180)
                .foregroundColor(.init(.secondarySystemBackground))
            VStack {
                Image(image)
                Text(title)
                    .font(.subheadline)
            }
        }
    }
}
