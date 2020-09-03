import SwiftUI
import Core

struct Stats: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var range = Smoke.Range.days
    @State private var cigarettes = [CGFloat]()
    @State private var cravings = [CGFloat]()
    @State private var savings = ""
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Stats")
                    .font(Font.title.bold())
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            }
            HStack {
                Text("General")
                    .font(Font.callout.bold())
                    .foregroundColor(.init(.tertiaryLabel))
                    .padding(.horizontal)
                Spacer()
            }
            Counter(title: "Savings", value: savings)
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Timeline")
                    .font(Font.callout.bold())
                    .foregroundColor(.init(.tertiaryLabel))
                    .padding(.horizontal)
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
            Chart(range: $range, title: "Cigarettes", values: cigarettes)
                .accentColor(.purple)
            Chart(range: $range, title: "Cravings", values: cravings)
                .accentColor(.pink)
            Spacer()
                .frame(height: 60)
        }.onAppear {
            update(range)
        }.onChange(of: tab) {
            if $0 == 1 {
                update(range)
            }
        }.onChange(of: range, perform: update)
    }
    
    private func update(_ range: Smoke.Range) {
        withAnimation(.easeInOut) {
            cigarettes = session.smoke.cigarettes(range).map { .init($0) }
            cravings = session.smoke.cravings(range).map { .init($0) }
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = session.user.currency.symbol
        savings = formatter.string(from: .init(value: session.smoke.savings(session.user)))!
    }
}

private struct Counter: View {
    let title: LocalizedStringKey
    let value: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.init(.secondarySystemBackground))
                .frame(height: 60)
            HStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
                Text(verbatim: value)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding()
            }
        }.padding()
    }
}
