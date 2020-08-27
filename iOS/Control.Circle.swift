import SwiftUI

extension Control {
    struct Circle: View {
        let image: String
        let color: Color
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                EmptyView()
            }.buttonStyle(Style { pressed in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 50, height: 50)
                        .shadow(color: color, radius: 2, x: -1, y: -1)
                        .shadow(color: color, radius: 6, x: 3, y: 3)
                        .foregroundColor(pressed ? color : .init(.systemBackground))
                    Image(systemName: image)
                        .font(.headline)
                        .foregroundColor(pressed ? .init(.systemBackground) : color)
                }.frame(width: 60, height: 60)
            })
        }
    }
}

private struct Style<Content>: ButtonStyle where Content : View {
    var hover: (Bool) -> Content
    
    func makeBody(configuration: Configuration) -> some View {
        hover(configuration.isPressed)
    }
}
