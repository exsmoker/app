import SwiftUI
import Core

struct Stats: View {
    @EnvironmentObject var session: Session
    @State private var range = Smoke.Range.days
    @State private var cigarettes = [CGFloat]()
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 10)
                HStack {
                    Text("Stats")
                        .font(Font.title.bold())
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                }
                Picker("", selection: $range) {
                    Text(.init(Smoke.Range.hours.title))
                        .tag(Smoke.Range.hours)
                    Text(.init(Smoke.Range.days.title))
                        .tag(Smoke.Range.days)
                    Text(.init(Smoke.Range.weeks.title))
                        .tag(Smoke.Range.weeks)
                }.pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                    .padding()
                Chart(values: $cigarettes, title: "Cigarettes", range: $range)
                Spacer()
                    .frame(height: 40)
            }
        }.navigationBarTitle("Stats", displayMode: .large)
        .onAppear {
            update(range)
        }
        .onChange(of: range, perform: update)
    }
    
    private func update(_ range: Smoke.Range) {
        withAnimation(.easeInOut) {
            cigarettes = session.smoke.cigarettes(range).map { .init($0) }
        }
    }
}
