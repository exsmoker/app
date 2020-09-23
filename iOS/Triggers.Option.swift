import SwiftUI
import Core

extension Triggers {
    struct Option: View {
        let reason: Core.Reason
        let width: CGFloat
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.init(.secondarySystemBackground))
                        .shadow(color: .init(.quaternaryLabel), radius: 5, x: 1, y: 1)
                    VStack {
                        Image(reason.image)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(.bottom)
                        HStack {
                            Text(.init(reason.category.name))
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Text(.init(reason.name))
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }.frame(width: width, height: 180)
            }.accentColor(.clear)
        }
    }

}
