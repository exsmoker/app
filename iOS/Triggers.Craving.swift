import SwiftUI
import Core

extension Triggers {
    struct Craving: View {
        @State private var reason: Reason?
        @State private var reasons = [[Reason]]()
        @Binding var display: Smoke.Trigger?
        
        var body: some View {
            NavigationView {
                GeometryReader { geo in
                    ScrollView {
                        HStack {
                            Text("You.can.resists")
                                .font(Font.title.bold())
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("Here.we.give.you")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.leading)
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 30)
                        Control.Title(title: "Gime.me.any", background: .accentColor, width: 200) {
                            
                        }
                        Spacer()
                            .frame(height: 30)
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
                }.navigationBarItems(trailing:
                                        Button(action: {
                                            display = nil
                                        }) {
                                            Text("Not.interested")
                                                .foregroundColor(.secondary)
                                                .padding()
                                        })
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
                }.sheet(item: $reason) { _ in
                    Circle()
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
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
