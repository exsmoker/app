//
//  Reason.swift
//  exsmoker
//
//  Created by vaux on 19.08.20.
//  Copyright © 2020 exsmoker. All rights reserved.
//

import SwiftUI

struct ReasonView: View {
    let reason: Reason
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 30)
            HStack {
                Text(.init(reason.title))
                    .bold()
                    .padding(.leading)
                    .foregroundColor(.secondary)
                Spacer()
            }
            HStack {
                Text(.init(reason.subtitle))
                    .font(Font.title.bold())
                    .padding(.leading)
                    .foregroundColor(.pink)
                Spacer()
            }
            Image(reason.image)
                .padding()
            HStack {
                Text(.init(reason.description))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                Spacer()
            }
        }
    }
}
