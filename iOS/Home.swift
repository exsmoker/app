import SwiftUI

struct Home: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var greet = LocalizedStringKey("")
    @State private var image = ""
    @State private var streak = ""
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 30)
            if !image.isEmpty {
                Image(image)
                    .padding()
            }
            HStack {
                Text(greet)
                    .font(.headline)
                    .padding(.leading)
                Spacer()
            }
            Spacer()
                .frame(height: 50)
            Control.Circle(image: "flame") {
                
            }
            Spacer()
                .frame(height: 50)
            Text("Your.current.streak")
                .font(.subheadline)
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
                    Text("More stats")
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
            Spacer()
                .frame(height: 20)
        }.onAppear {
            update()
        }.onChange(of: tab) {
            if $0 == 0 {
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
}
