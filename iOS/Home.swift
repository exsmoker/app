import SwiftUI

struct Home: View {
    @EnvironmentObject var session: Session
    @State private var greet = ""
    @State private var image = ""
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 30)
            if !image.isEmpty {
                Image(image)
                    .padding()
            }
            HStack {
                Text(.init(greet))
                    .bold()
                    .foregroundColor(.secondary)
                Spacer()
            }.padding()
        }.onAppear {
            switch Calendar.current.component(.hour, from: .init()) {
            case 6 ..< 12:
                greet = "Greet.morning \(session.user.name)"
                image = "home_morning"
            case 12:
                greet = "Greet.noon"
                image = "home_noon"
            case 13 ..< 17:
                greet = "Greet.afternoon"
                image = "home_afternoon"
            case 17 ..< 22:
                greet = "Greet.evening"
                image = "home_evening"
            default:
                greet = "Greet.night"
                image = "home_night"
            }
        }
    }
}

private struct Profile: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.init(.secondarySystemBackground))
                    .shadow(color: .init(.tertiaryLabel), radius: 16, x: 0, y: 0)
                    .padding()
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
            }.padding(.top, 50)
            Text(verbatim: session.user.name)
                .bold()
                .foregroundColor(.primary)
                .padding(.top)
            Text(verbatim: session.user.location)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}
