import SwiftUI

struct Reasons: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var percent = Double()
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Reasons")
                    .font(Font.title.bold())
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            }
            HStack {
                Text("Interesting.rate")
                    .font(Font.callout.bold())
                    .foregroundColor(.init(.tertiaryLabel))
                    .padding(.horizontal)
                Spacer()
            }
            Ring(percent: $percent)
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Popular.reasons")
                    .font(Font.callout.bold())
                    .foregroundColor(.init(.tertiaryLabel))
                    .padding(.horizontal)
                Spacer()
            }
        }.onChange(of: tab) {
            if $0 == 2 {
                update()
            }
        }
    }
    
    private func update() {
        percent = 0
        withAnimation(.easeInOut(duration: 1)) {
            percent = session.smoke.success
        }
    }
}
