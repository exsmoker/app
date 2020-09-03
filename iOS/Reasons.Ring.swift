import SwiftUI

extension Reasons {
    struct Ring: View {
        @Binding var percent: Double
        
        var body: some View {
            ZStack {
                Ringin(percent: percent)
                    .fill(Color.accentColor.opacity(0.3))
                Path {
                    $0.addArc(center: .init(x: 80, y: 80),
                        radius: 78,
                        startAngle: .init(degrees: 0),
                        endAngle: .init(degrees: 360),
                        clockwise: false)
                }.stroke(Color.accentColor, style: .init(lineWidth: 4, lineCap: .round))
                Path {
                    $0.addArc(center: .init(x: 80, y: 80),
                        radius: 50,
                        startAngle: .init(degrees: 0),
                        endAngle: .init(degrees: 360),
                        clockwise: false)
                }.foregroundColor(.init(.systemBackground))
                HStack {
                    Spacer()
                    Text("\(Int(percent * 100))")
                        .font(Font.title.bold())
                        .foregroundColor(.accentColor)
                    Text("%")
                        .foregroundColor(.accentColor)
                        .font(.footnote)
                    Spacer()
                }
            }.frame(width: 160, height: 160)
                .padding(.init(top: 10, leading: 0, bottom: 30, trailing: 0))
        }
    }
}

private struct Ringin: Shape {
    var percent: Double
    
    func path(in rect: CGRect) -> Path {
        .init {
            $0.move(to: .init(x: rect.midX, y: rect.midY))
            $0.addArc(center: .init(x: rect.midX, y: rect.midY),
                        radius: 80,
                        startAngle: .init(degrees: -90),
                        endAngle: .init(degrees: (360 * percent) - 90),
                        clockwise: false)
            $0.closeSubpath()
        }
    }
    
    var animatableData: Double {
        get { percent }
        set { percent = newValue }
    }
}
