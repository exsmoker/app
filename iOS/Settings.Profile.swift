import SwiftUI

extension Settings {
    struct Profile: View {
        @EnvironmentObject var session: Session
        
        var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.init(.secondarySystemBackground))
                        .shadow(color: .init(.tertiaryLabel), radius: 25, x: 0, y: 0)
                        .padding()
                    Image(systemName: "person.fill")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.accentColor)
                }.frame(width: 200)
                .padding()
                Text(verbatim: session.user.name)
                    .bold()
                Text(verbatim: session.user.location)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}
