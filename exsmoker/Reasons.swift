//
//  Reasons.swift
//  exsmoker
//
//  Created by vaux on 19.08.20.
//  Copyright © 2020 exsmoker. All rights reserved.
//

import SwiftUI

struct Reasons: View {
    @State private var family = false
    @State private var political = false
    @State private var economical = false
    @State private var finance = false
    @State private var social = false
    @State private var ecological = false
    @State private var health = false
    @State private var reasons = [[Reason]]()
    
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
                    ForEach(self.reasons, id: \.self) { item in
                        HStack {
                            Spacer()
                            Item(reason: item.first!, width: geo.size.width / 2.2)
                            Spacer()
                            if item.count == 2 {
                                Item(reason: item.last!, width: geo.size.width / 2.2)
                                Spacer()
                            }
                        }
                    }
                }
            }.navigationBarTitle("Reasons", displayMode: .large)
                .onAppear {
                    self.reasons = stride(from: 0, to: Reason.allCases.count, by: 2).reduce(into: []) {
                        $0.append({
                            var item = [Reason.allCases[$0]]
                            if $0 + 1 < Reason.allCases.count {
                                item.append(Reason.allCases[$0 + 1])
                            }
                            return item
                        } ($1))
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct Item: View {
    let reason: Reason
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.init(.secondarySystemBackground))
                .shadow(color: .init(.secondarySystemBackground), radius: 3, x: 1, y: 1)
            VStack {
                Image(reason.image)
                    .renderingMode(.original)
                HStack {
                    Text(.init(reason.title))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Text(.init(reason.subtitle))
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    Spacer()
                }
            }
        }.frame(width: width, height: 240)
    }
}