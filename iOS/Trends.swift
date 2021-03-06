import SwiftUI
import Core

struct Trends: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var trends = [Smoke.Trend]()
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Trends")
                    .font(Font.title.bold())
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            }
            HStack {
                Text("Most.triggers")
                    .font(Font.callout.bold())
                    .foregroundColor(.init(.tertiaryLabel))
                    .padding(.horizontal)
                Spacer()
            }
            if trends.isEmpty {
                Spacer()
                    .frame(height: 60)
                Text("Not.enough")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                ForEach(trends) { item in
                    Rating(index: trends.firstIndex { $0.id == item.id }!, trend: item)
                }
            }
            Spacer()
                .frame(height: 60)
        }.onAppear {
            if tab == 3 {
                update()
            }
        }
        .onChange(of: tab) {
            if $0 == 3 {
                update()
            }
        }
    }
    
    private func update() {
        withAnimation {
            trends = session.smoke.trends
        }
    }
}
