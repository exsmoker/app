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
    @State private var reason: Reason?
    
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
                            Item(reason: item.first!, width: geo.size.width / 2.4) {
                                self.reason = item.first
                            }
                            Spacer()
                            if item.count == 2 {
                                Item(reason: item.last!, width: geo.size.width / 2.4) {
                                    self.reason = item.last
                                }
                                Spacer()
                            }
                        }.padding(.vertical, 6)
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
            }.sheet(item: $reason) {
                ReasonView(reason: $0)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct Item: View {
    let reason: Reason
    let width: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.init(.secondarySystemBackground))
                    .shadow(color: .init(.quaternaryLabel), radius: 5, x: 1, y: 1)
                VStack {
                    Image(reason.image)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.bottom)
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
            }.frame(width: width, height: 180)
        }.accentColor(.clear)
    }
}
