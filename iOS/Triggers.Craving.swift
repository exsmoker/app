import SwiftUI
import Core

extension Triggers {
    struct Craving: View {
        @EnvironmentObject var session: Session
        @State private var reason: Core.Reason?
        @State private var reasons = [[Core.Reason]]()
        @State private var cancelable = true
        @Binding var visible: Smoke.Trigger?
        
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
                            session.craving(.init(reasons.last!.last, visible!))
                            reason = reasons.last!.last
                        }
                        Spacer()
                            .frame(height: 30)
                        ForEach(reasons, id: \.self) { item in
                            HStack {
                                Spacer()
                                Item(reason: item.first!, width: geo.size.width / 2.4) {
                                    session.craving(.init(item.first!, visible!))
                                    reason = item.first
                                }
                                Spacer()
                                if item.count == 2 {
                                    Item(reason: item.last!, width: geo.size.width / 2.4) {
                                        session.craving(.init(item.last!, visible!))
                                        reason = item.last
                                    }
                                    Spacer()
                                }
                            }.padding(.vertical, 6)
                        }
                    }
                }.navigationBarItems(trailing:
                                        Button(action: {
                                            if cancelable {
                                                session.craving(.init(nil, visible!))
                                                visible = nil
                                            }
                                        }) {
                                            Text("Not.interested")
                                                .foregroundColor(.secondary)
                                                .padding()
                                        })
                .onAppear {
                    let all = Core.Reason.allCases.shuffled()
                    reasons = stride(from: 0, to: all.count, by: 2).reduce(into: []) {
                        $0.append({
                            var item = [all[$0]]
                            if $0 + 1 < all.count {
                                item.append(all[$0 + 1])
                            }
                            return item
                        } ($1))
                    }
                }.sheet(item: $reason, onDismiss: {
                    cancelable = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        visible = nil
                    }
                }) {
                    Reason(reason: $0, visible: $reason)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

private struct Item: View {
    let reason: Core.Reason
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
                        Text(.init(reason.category.name))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Text(.init(reason.name))
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
