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
    @State private var reasons = [ReasonModel]()
    
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
                        Button(action: {
                            self.family = true
                        }) {
                            Item(title: "Family", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$family) {
                                Reason()
                        }
                        Spacer()
                        Button(action: {
                            self.political = true
                        }) {
                            Item(title: "Political", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$political) {
                                Reason()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.economical = true
                        }) {
                            Item(title: "Economical", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$economical) {
                                Reason()
                        }
                        Spacer()
                        Button(action: {
                            self.finance = true
                        }) {
                            Item(title: "Finance", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$finance) {
                                Reason()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.social = true
                        }) {
                            Item(title: "Social", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$social) {
                                Reason()
                        }
                        Spacer()
                        Button(action: {
                            self.ecological = true
                        }) {
                            Item(title: "Ecological", image: "", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$ecological) {
                                Reason()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.health = true
                        }) {
                            Item(title: "Health", image: "health", width: geo.size.width / 2.2)
                        }.accentColor(.clear)
                            .sheet(isPresented: self.$health) {
                                Reason()
                        }
                        Spacer()
                        Item(title: "-", image: "", width: geo.size.width / 2.2)
                        Spacer()
                    }
                }
            }.navigationBarTitle("Reasons", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear {
            self.reasons = try! JSONDecoder().decode([ReasonModel].self, from: Data(contentsOf: Bundle.main.url(forResource: "reasons", withExtension: "json")!))
        }
    }
}

private struct Item: View {
    let title: String
    let image: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width, height: 220)
                .foregroundColor(.init(.secondarySystemBackground))
                .shadow(color: .init(.secondarySystemBackground), radius: 3, x: 1, y: 1)
            VStack {
                Image(image)
                    .renderingMode(.original)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
