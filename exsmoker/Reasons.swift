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
                    ForEach(self.reasons) { reason in
                        Group {
                            Spacer()
                            Item(title: reason.id, image: reason.image, width: geo.size.width / 2.2)
                        }
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
