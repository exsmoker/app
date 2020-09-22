import SwiftUI
import Core

extension Reasons {
    struct Rating: View {
        let rating: Reason.Rating
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.init(.secondarySystemBackground))
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Image(rating.reason.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                    VStack {
                        HStack {
                            Spacer()
                            Text(verbatim: "\(Int(rating.percent * 100))")
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
                            Text(.init(rating.reason.name))
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
