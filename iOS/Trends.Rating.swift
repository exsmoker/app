import SwiftUI
import Core

extension Trends {
    struct Rating: View {
        let trend: Smoke.Trend
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.init(.secondarySystemBackground))
                HStack {
                    Spacer()
                        .frame(width: 20)
                    VStack {
                        HStack {
                            Spacer()
                            Text(verbatim: "\(Int(trend.percent * 100))")
                                .font(Font.title.bold())
                                .foregroundColor(.accentColor)
                                .animation(.none)
                            Text(verbatim: "%")
                                .foregroundColor(.accentColor)
                                .font(.footnote)
                                .animation(.none)
                                .offset(x: -4)
                                .padding(.trailing)
                        }.padding(.top)
                        HStack {
                            Spacer()
                            Text(.init(trend.trigger.title))
                                .font(.headline)
                                .padding()
                        }
                        Spacer()
                    }
                }
            }.padding(.horizontal)
        }
    }
}
