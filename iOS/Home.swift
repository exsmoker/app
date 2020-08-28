import SwiftUI

struct Home: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var greet = LocalizedStringKey("")
    @State private var image = ""
    @State private var streak = ""
    @State private var disclose = false
    @State private var cravingY = CGFloat()
    @State private var smokedY = CGFloat()
    @State private var event: Triggers.Event?
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer()
                    .frame(height: 40)
                if !image.isEmpty {
                    Image(image)
                        .padding()
                }
                Text(greet)
                    .font(.headline)
                    .padding(.leading)
                Text("Your.current.streak")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Text(verbatim: streak)
                    .font(Font.largeTitle.bold())
                    .foregroundColor(.accentColor)
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            tab = 1
                        }
                    }) {
                        HStack {
                            Text("Stats")
                            Image(systemName: "chart.bar.fill")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.secondary)
                        .padding()
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            tab = 1
                        }
                    }) {
                        HStack {
                            Text("Stats")
                            Image(systemName: "chart.bar.fill")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.secondary)
                        .padding()
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            tab = 2
                        }
                    }) {
                        HStack {
                            Text("Cravings")
                            Image(systemName: "chart.pie.fill")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.secondary)
                        .padding()
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            tab = 3
                        }
                    }) {
                        HStack {
                            Text("Trends")
                            Image(systemName: "star.fill")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.secondary)
                        .padding()
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            tab = 4
                        }
                    }) {
                        HStack {
                            Text("Settings")
                            Image(systemName: "slider.horizontal.3")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.secondary)
                        .padding()
                    }
                }
            }
            VStack {
                Spacer()
                ZStack {
                    if disclose {
                        Control.Title(title: "Craving", background: .purple, width: 180) {
                            event = .craving
                            hide()
                        }.offset(y: cravingY)
                        Control.Title(title: "Smoked", background: .purple, width: 180) {
                            event = .smoked
                            hide()
                        }.offset(y: smokedY)
                    }
                    Control.Circle(image: disclose ? "xmark" : "flame", color: disclose ? .purple : .accentColor) {
                        if disclose {
                            hide()
                        } else {
                            show()
                        }
                    }.sheet(item: $event) {
                        Triggers(event: $0, visible: $event)
                    }
                }
                Spacer()
                    .frame(height: 80)
            }
        }.onAppear {
            update()
        }.onChange(of: tab) {
            if $0 == 0 {
                update()
            }
        }.onChange(of: event) {
            if $0 == nil {
                update()
            }
        }
    }
    
    private func update() {
        switch Calendar.current.component(.hour, from: .init()) {
        case 6 ..< 12:
            greet = "Greet.morning \(session.user.name.components(separatedBy: " ").first!)"
            image = "home_morning"
        case 12:
            greet = "Greet.noon \(session.user.name.components(separatedBy: " ").first!)"
            image = "home_noon"
        case 13 ..< 17:
            greet = "Greet.afternoon \(session.user.name.components(separatedBy: " ").first!)"
            image = "home_afternoon"
        case 17 ..< 22:
            greet = "Greet.evening \(session.user.name.components(separatedBy: " ").first!)"
            image = "home_evening"
        default:
            greet = "Greet.night \(session.user.name.components(separatedBy: " ").first!)"
            image = "home_night"
        }
        streak = session.smoke.streak
    }
    
    private func hide() {
        withAnimation(Animation.easeOut(duration: 0.3)) {
            smokedY = 0
            cravingY = 0
        }
        withAnimation(Animation.linear(duration: 0.1).delay(0.1)) {
            disclose = false
        }
    }
    
    private func show() {
        withAnimation(Animation.linear(duration: 0.3)) {
            disclose = true
        }
        withAnimation(Animation.easeOut(duration: 0.2).delay(0.1)) {
            smokedY = -70
        }
        withAnimation(Animation.easeOut(duration: 0.3).delay(0.1)) {
            cravingY = -130
        }
    }
}
